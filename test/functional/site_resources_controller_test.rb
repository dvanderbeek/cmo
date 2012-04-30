require 'test_helper'

class SiteResourcesControllerTest < ActionController::TestCase
  setup do
    @site_resource = site_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_resource" do
    assert_difference('SiteResource.count') do
      post :create, site_resource: @site_resource.attributes
    end

    assert_redirected_to site_resource_path(assigns(:site_resource))
  end

  test "should show site_resource" do
    get :show, id: @site_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_resource
    assert_response :success
  end

  test "should update site_resource" do
    put :update, id: @site_resource, site_resource: @site_resource.attributes
    assert_redirected_to site_resource_path(assigns(:site_resource))
  end

  test "should destroy site_resource" do
    assert_difference('SiteResource.count', -1) do
      delete :destroy, id: @site_resource
    end

    assert_redirected_to site_resources_path
  end
end
