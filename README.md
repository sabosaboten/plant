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