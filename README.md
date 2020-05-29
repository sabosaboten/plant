# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


div class="follower-box">
    <h3>フォロー一覧</h3>
      <% @user.following_user.where.not(id: current_user.id).each do |user| %>
        <p>
          <%= "id: #{user.id} email: #{user.email}" %>
          <%= "#{user.name}" %>
          <% if current_user.following?(user) %>
            <%= link_to 'フォロー外す', unfollow_path(user.id), method: :POST %>
          <% else %>
            <%= link_to 'フォローする', follow_path(user.id), method: :POST %>
          <% end %>
          <%= link_to "show", user_path(user) %>
        </p>
      <% end %>
    </div>
    
    <div class="followed-box">
      <h3>フォロワー一覧</h3>
        <% @user.follower_user.where.not(id: current_user.id).each do |user| %>
        <p>
          <%= "id: #{user.id} email: #{user.email}" %>
          <%= "#{user.name}" %>
          <% if current_user.following?(user) %>
            <%= link_to 'フォロー外す', unfollow_path(user.id), method: :POST %>
          <% else %>
            <%= link_to 'フォローする', follow_path(user.id), method: :POST %>
          <% end %>
          <%= link_to "show", user_path(user) %>
        </p>
        <% end %>
    </div>

    <div class="like-box">
      <h3>Like一覧</h3>
        <%="いいね！#{@likes.count}件"%>
    </div>
  </div>



  <div class = "up">
</div>


<p>住所</p>
<p><%= @shop.address %></p>(住所名表示)

<div id="map"></div>(地図を表示)
・・・

<style>(地図の大きさ指定)
#map{
  height: 150px;
  width:270px;
}
</style>

<script type="text/javascript">
    function initMap() {

        var test ={lat: <%= @shop.latitude %>, lng: <%= @shop.longitude %>};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: test
        });
        var transitLayer = new google.maps.TransitLayer();
        transitLayer.setMap(map);

        var contentString = '店名：<%= @shop.name %>';
        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        var marker = new google.maps.Marker({
            position:test,
            map: map,
            title: contentString
        });

        marker.addListener('click', function() {
            infowindow.open(map, marker);
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4Jr1NrfngK80oIANtzFL6LWsYJSKoz3c&callback=initMap" async defer></script>




<p>住所</p>
<p><%= @shop.address %></p>(住所名表示)

<div id="map"></div>(地図を表示)


<style>(地図の大きさ指定)
#map{
  height: 150px;
  width:270px;
}
</style>

<script type="text/javascript">
     
    function initMap() {
        <% @shops.each do |shop| %>
        var test ={lat: <%= shop.latitude %>, lng: <%= shop.longitude %>};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: test
        });
        var transitLayer = new google.maps.TransitLayer();
        transitLayer.setMap(map);
        var contentString = '店名：<%= shop.name %>';
        <% end %>
        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });
        var marker = new google.maps.Marker({
            position:test,
            map: map,
            title: contentString
        });

        marker.addListener('click', function() {
            infowindow.open(map, marker);
        });
      }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4Jr1NrfngK80oIANtzFL6LWsYJSKoz3c&callback=initMap" async defer></script>

















<%# -# !!!
-# %html
-#   %head
-#     %meta{content: "text/html; charset=UTF-8", "http-equiv": "Content-Type"}/
-#     %title Plant
-#     = stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
-#     = javascript_include_tag 'application', 'data-turbolinks-track' => true
-#     = csrf_meta_tags
-#   %body
-#     .header
-#       = link_to "プラントマネジメント", posts_path
-#       = link_to "投稿一覧", posts_path
-#       = link_to "投稿", new_post_path
-#       = link_to "ショッピングページ", maps_index_path
-#       = link_to "プラント管理ページ", schedules_path
-#       = link_to "投稿マイページ", user_path(current_user)
-#       = link_to edit_user_path(current_user) do
-#         = icon('fas', 'cog', class: 'icon')
-#     = yield
-#     .footer %>


<!DOCTYPE html>
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <title>Plant</title>
    <%# <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
    <%= stylesheet_link_tag    'application', media: 'all' %>
    <%# <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
    <%= javascript_include_tag 'application' %>
    <%= csrf_meta_tags%>
  </head>

  <body data-turbolinks="false">
    <header class="header">
      <%= link_to users_path do %>
        <img src="https://img.icons8.com/color/96/000000/natural-food.png", width="85" height="85", class="header-icon">
      <% end %>
      <%= link_to "投稿一覧", posts_path%>
      <% if user_signed_in? %>
      <%= link_to "記事投稿", new_post_path%>
      <%= link_to "店投稿", new_shop_path%>
      <% end %>
      <%= link_to "ショッピングページ", shops_path%>
      <%= link_to "プラント管理ページ", schedules_path%>
      <%# <%= link_to "投稿マイページ", user_path(current_user.id)%>
      <%# <%= link_to edit_user_path(current_user)%>
        <%# <%= icon('fas', 'cog', class: 'icon')%>
      
      <% if user_signed_in? %>
        <div class="user_nav grid-6">
          <span><%= current_user.name %>
            <ul class="user__info">
              <li>
                <a href="/users/<%= current_user.id %>">マイページ</a>
                <%= link_to "ログアウト", destroy_user_session_path, method: :delete %>
              </li>
            </ul>
          </span>
            <a class="post" href="/posts/new">投稿する</a>
          </div>
        <% else %>
          <div class="grid-6">
            <%= link_to "ログイン", new_user_session_path, :class => 'post' %>
            <%= link_to "新規登録", new_user_registration_path, :class => 'post' %>
          </div>
        <% end %>

    <%# <ul class="menu">
        <li><a href="#" id="about" class="menu_item active">新規投稿</a></li>
        <li><a href="#" id="service" class="menu_item">人気投稿</a></li>
    </ul> %>



  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navi" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
 
      <div class="collapse navbar-collapse" id="bs-navi">
        <ul class="nav navbar-nav">
          <li><a href="posts">投稿</a></li>
          <li><a href="shops">プラントショップ</a></li>
          <li><a href="#">マイページ</a></li>
          <li><a href="#">マイプラント</a></li>
          <li><a href="#">お問い合わせ</a></li>
        </ul>
      </div>
    </div>
  </nav>












    </header>

    <%= yield %>
    
    <%# <footer class="footer">
      <p>
        Copyright Plant 2020.
      </p>
    </footer> %>
    
  </body>
</html>

<%# 
    <% meta{content: "text/html; charset=UTF-8", "http-equiv": "Content-Type"}/ %>












    <script type="text/javascript">
  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#img_prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $(".post_img").change(function(){
        readURL(this);
    });
  });
</script>