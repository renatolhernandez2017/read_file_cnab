require "test_helper"

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get uploads_url
    assert_response :success
  end

  test "should create upload with valid file and hash_link" do
    user = users(:one)
    file = fixture_file_upload("files/valid_cnab.txt", "text/plain")
    post uploads_url, params: {file: file, hash_link: user.hash_link}

    assert_response :success
    assert_equal "Arquivo processado com sucesso!", session[:message]
    assert_not_nil session[:user_id]
  end

  test "should not create upload with invalid hash_link" do
    file = fixture_file_upload("files/valid_cnab.txt", "text/plain")
    post uploads_url, params: {file: file, hash_link: "invalid_hash_link"}

    assert_response :success
    assert_equal "Código inválido!", session[:message]
    assert_nil session[:user_id]
  end

  test "should not create upload without file" do
    user = users(:one)
    post uploads_url, params: {hash_link: user.hash_link}

    assert_redirected_to root_path
    assert_equal "Nenhum arquivo selecionado.", flash[:alert]
  end
end
