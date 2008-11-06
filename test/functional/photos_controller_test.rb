require File.dirname(__FILE__) + '/../test_helper'

class PhotosControllerTest < ActionController::TestCase

  def test_should_create_photo_and_transliterate_filename
    photo = fixture_file_upload("/files/IT's, UPPERCASE!  AND, WeIRD.JPG", "image/jpeg")

    # Upload using standard create action
    assert_difference 'Photo.count', 3 do
      post :create,
           :name => 'a name', :description => 'a desc',
           :category_id => categories(:one).id,
           :photo => { :uploaded_data => photo },
           :html => { :multipart => true }
      assert_response :redirect 
    end

    assert_equal "it_s_uppercase_and_weird.jpg", assigns(:photo).filename

    # Test if physical file is actually added (and later deleted)
    filepath = assigns(:photo).public_filename
    assert File.exists?(filepath)
    
    # Also test the destruction of the file and file data. Included as one test because of the
    # time it takes to run these tests and I don't want to leave files in the temporary directory
    assert_difference 'Photo.count', -3 do
      delete :destroy, :category_id => categories(:one).id, 
                       :id => assigns(:photo).id
    end

    # Did the file get deleted?
    assert !File.exists?(filepath)
  end

end
