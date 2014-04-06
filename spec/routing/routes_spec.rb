require 'spec_helper'


describe "routing to hotels" do
  it "routes /hotels index" do
    expect(:get => "/hotels").to route_to(
                                     :controller => "hotels",
                                     :action => "index"
                                 )
  end

  it "routes /hotels create" do
    expect(:post => "/hotels").to route_to(
                                     :controller => "hotels",
                                     :action => "create"
                                 )
  end

  it "routes /hotels/new" do
    expect(:get => "/hotels/new").to route_to(
                                     :controller => "hotels",
                                     :action => "new"
                                 )
  end

  it "routes /hotels/:id/edit" do
    expect(:get => "/hotels/2/edit").to route_to(
                                     :controller => "hotels",
                                     :action => "edit",
                                     :id => "2"
                                 )
  end

  it "routes /hotels/:id" do
    expect(:get => "/hotels/2").to route_to(
                                            :controller => "hotels",
                                            :action => "show",
                                            :id => "2"
                                        )
  end

  it "routes patch /hotels/:id/update" do
    expect(:patch => "/hotels/2").to route_to(
                                            :controller => "hotels",
                                            :action => "update",
                                            :id => "2"
                                        )
  end

  it "routes put /hotels/:id/update" do
    expect(:put => "/hotels/2").to route_to(
                                         :controller => "hotels",
                                         :action => "update",
                                         :id => "2"
                                     )
  end

  it "routes /hotels/:id/delete" do
    expect(:delete => "/hotels/2").to route_to(
                                         :controller => "hotels",
                                         :action => "destroy",
                                         :id => "2"
                                     )
  end


  it "routes /hotels/:hotel_id/comments create" do
    expect(:post => "/hotels/2/comments").to route_to(
                                         :controller => "comments",
                                         :action => "create",
                                         :hotel_id => "2"
                                     )
  end

  it "routes /hotels/:hotel_id/comments/new" do
    expect(:get => "/hotels/2/comments/new").to route_to(
                                                 :controller => "comments",
                                                 :action => "new",
                                                 :hotel_id => "2"
                                             )
  end

  it "routes /hotels/:hotel_id/comments/:id" do
    expect(:delete => "/hotels/2/comments/1").to route_to(
                                                    :controller => "comments",
                                                    :action => "destroy",
                                                    :hotel_id => "2",
                                                    :id => "1"
                                                )
  end

end