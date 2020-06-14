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


# CULT.ivate
観葉植物の育成を趣味としている人々に向けた観葉植物の総合SNSアプリです。(以下のサービスを使用できます)
1.お気に入りの観葉植物の写真を投稿し、共有。<br>
2.お気に入りの観葉植物のお店の場所を投稿し、共有。<br>
3.自分が所持している観葉植物を登録し、水やりカレンダーの記録。<br>
開発環境と本番環境にDocker、インフラにAWSの各種サービスを活用しています。<br>
<!-- また、CircleCIを用いてCI/CDパイプラインを実現しています。 -->

![CULT.ivate画面](https://user-images.githubusercontent.com/64722228/84588844-943a4c80-ae65-11ea-9d38-39bb6235850f.png)

## 制作背景
私の趣味は観葉植物の育成です。
しかし、「他の人がどんな観葉植物を持っていて、どんな場所で買っているのか?」について知ることが難しいため、お互いに情報を共有できるアプリを作成しました。
また、自分が水やりをいつやったか忘れてしまうことが多くあるため、シンプルに使いやすい水やりカレンダーに記録をすることで、水やりのスケジュールを把握する機能もあります。

## URL
https://<br>
- 非ログイン状態の場合は閲覧、検索のみ可能です。ログインすると投稿やコメントが可能になります。<br>
- ログイン画面の「かんたんログイン」をクリックすると、メールアドレスとパスワードを入力せずにログインできます。<br>
- レスポンシブ対応しているので、スマホからでもご覧いただけます。

## 使用技術
- Ruby 2.5.1, Rails 5.0.7.2
- MySQL 5.6.47
<!-- - Nginx, Puma
- AWS（VPC, ECS, ECR, RDS, Route 53, ELB, ACM, S3, CloudFront）
- Docker/docker-compose -->
- CircleCI (CI/CDパイプラインを構築)
- RSpec
- Sass, Bootstrap, jQuery
- Fullcalender
- Google Map Api

## AWS構成図
![AWS構成図]()

## 機能一覧
観葉植物投稿サービス関連
- ユーザー機能
  - deviseを使用
  - 新規登録、ログイン、ログアウト機能
  - かんたんログイン機能
- 記事関係
  - 記事一覧表示、記事詳細表示、記事投稿、記事編集、記事削除機能
  - 画像のアップロードはcarrierwaveを使用
  - プレビュー機能
- コメント関係
  - コメント表示、コメント投稿、コメント削除機能
- ページネーション機能
  - kaminariを使用
  <!-- - (kaminari + Infinite Scroll)を使用 -->
- いいね機能
  - 登録したいいねの一覧表示、人気順表示機能
  <!-- - Ajaxを使用 -->
- フォロー機能
  - フォロー、フォロワー一覧表示機能
  <!-- - Ajaxを使用 -->
- 検索機能
  - 投稿記事の内容を検索
水やりカレンダーサービス関連
- 水やりカレンダー機能
  - 登録した観葉植物の水やりした日にちの記録機能
観葉植物店共有サービス関連
- 観葉植物店共有機能
  - Google Mapから住所を検索
  - 検索した住所を地図上に登録(緯度と経度に変換して登録)
  - 登録した住所を地図上に表示(緯度と軽度から反映)
<!-- - 管理ユーザー機能
  - ユーザー一覧の表示、一般ユーザーのアカウントや投稿、コメントを削除可能 -->
<!-- - Rspecによる自動テスト機能
  - 単体テスト機能
  - 統合テスト機能 -->
<!-- - その他
  - SelectBoxの中身を動的に変更する機能
    - 都道府県SelectBoxに対する市区町村SelectBoxをAjaxで動的に制御 -->

## ER図
![ER図](https://user-images.githubusercontent.com/64722228/84588808-4887a300-ae65-11ea-8636-64687c1887c0.png)
