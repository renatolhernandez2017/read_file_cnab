class UploadsController < ApplicationController
  include Pagy::Backend

  def index
    @transactions = Transaction.where(user_id: session[:user_id]) if session[:user_id].present?
    @transactions = Transaction.all unless session[:user_id].present?
    @transactions = @transactions.group_by(&:store_name)
  end

  def create
    if params[:file].present? && params[:hash_link].present?
      uploaded_file = params[:file]
      user = User.find_by(hash_link: params[:hash_link])

      unless user.present?
        session[:message] = "Código inválido!"
        session[:error] = "Error"

        render turbo_stream: [
          turbo_stream.append("modals", partial: "shared/modal"),
          turbo_stream.after("modals") do
            "<script>document.getElementById('modal_button').click();</script>".html_safe
          end
        ]
        reset_session
        return
      end

      transactions_ids = []
      File.foreach(uploaded_file.path) do |line|
        transactions_ids << process_line(line, user).id
      end

      session[:user_id] = user.id
      session[:message] = "Arquivo processado com sucesso!"

      render turbo_stream: [
        turbo_stream.append("modals", partial: "shared/modal"),
        turbo_stream.after("modals") do
          "<script>document.getElementById('modal_button').click();</script>".html_safe
        end
      ]
      reset_session
    else
      flash[:alert] = "Nenhum arquivo selecionado."

      redirect_to root_path
    end
  end

  private

  def process_line(line, user)
    kind = line[0]
    date_ocurrence = Date.strptime(line[1..8], "%Y%m%d")
    price = line[9..18].to_i / 100.0
    cpf = line[19..29]
    card = line[30..41]
    time_ocurrence = Time.strptime(line[42..47], "%H%M%S")
    store_owner = line[48..61].strip
    store_name = line[62..].strip

    Transaction.create!(
      kind: kind,
      date_ocurrence: date_ocurrence,
      price: price,
      cpf: cpf,
      card: card,
      time_ocurrence: time_ocurrence,
      store_owner: store_owner,
      store_name: store_name,
      user_id: user.id
    )
  end
end
