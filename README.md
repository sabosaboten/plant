# CULT.ivate
観葉植物の育成を趣味としている人々に向けた観葉植物の総合SNSアプリです。
(以下のサービスを使用できます)
1. 観葉植物の写真を投稿し、共有。<br>
2. 観葉植物店の場所を投稿し、共有。<br>
3. 自分が所持している観葉植物を登録&水やりカレンダーの記録。<br>

インフラにAWSの各種サービスを活用しています。<br>
<!-- 開発環境と本番環境にDocker、インフラにAWSの各種サービスを活用しています。<br> -->
<!-- また、CircleCIを用いてCI/CDパイプラインを実現しています。 -->
![CULT.ivate画面](https://user-images.githubusercontent.com/64722228/84588844-943a4c80-ae65-11ea-9d38-39bb6235850f.png)

## 制作背景
私の趣味は観葉植物の育成ですが、「他の人がどんな観葉植物を持っていて、どんな場所で観賞植物を購入しているのかについて知ることが難しいため、お互いに情報を共有できるアプリを作成しました。
また、観葉植物への水やりを最後にいつやったか忘れてしまうことが多くあるため、カレンダーに記録をすることで、水やりのスケジュールを把握する機能があります。

## URL
http://18.181.11.230/<br>
- 非ログイン状態の場合は閲覧、検索のみ可能です。ログインすると投稿やコメントが可能になります。<br>
- ログイン画面の「かんたんログイン」をクリックすると、メールアドレスとパスワードを入力せずにログインできます。<br>
- レスポンシブ対応しているので、スマホからでもご覧いただけます。

## 使用技術
- Ruby 2.5.1, Rails 5.0.7.2
- MySQL 5.6.47
- Sass, Bootstrap, jQuery
- Fullcalender
- Google Map Api
<!-- - Nginx, Puma
- AWS（VPC, ECS, ECR, RDS, Route 53, ELB, ACM, S3, CloudFront）
- Docker/docker-compose
- CircleCI (CI/CDパイプラインを構築)
- RSpec -->

## AWS構成図
<!-- ![AWS構成図]() -->

## 機能一覧
### 観葉植物投稿サービス関連
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
### 観葉植物店共有サービス関連
- 観葉植物店共有機能
  - Google Mapから住所を検索
  ![8e9913b0c42b1ce4a2a9c58efca014d5](https://user-images.githubusercontent.com/64722228/84589738-9b645900-ae6b-11ea-85f9-9010d9164a90.gif)
  - 検索した住所を地図上に登録(緯度と経度に変換して登録)し、地図上に表示
  ![99833a365d5add710efc309c47f2a159](https://user-images.githubusercontent.com/64722228/84589821-4b39c680-ae6c-11ea-8958-145f16d1dfe1.gif)
### 水やりカレンダーサービス関連
- 観葉植物の登録機能
  - 保有している観葉植物をマイページに登録
  ![d680c6d0d2f5e2638e347f19e7885498](https://user-images.githubusercontent.com/64722228/84590046-1e86ae80-ae6e-11ea-9510-8e60ece783b6.gif)

- 水やりカレンダー機能
  - 登録した観葉植物の水やりした日にちの記録機能
  ![839e79d8a4fc4a777417f9fca81f646b](https://user-images.githubusercontent.com/64722228/84589912-14b07b80-ae6d-11ea-8eb2-73baf521f9f0.gif)
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

## 工夫したポイント
- サービス
  - マイページにユーザー関連の情報を追加することで、興味のあるユーザーの情報を一覧で見れるようにしました
  - Google Map APIを使用することで、観葉植物店の情報を簡単に登録できるようにしました
- 直感的な操作性
  - 一貫したデザインを通して、説明無しで操作方法がわかり、クリックの数を減らすことで簡単に使えるようにしています
- レスポンシブなデザイン
  - どのデバイスからでも見れるように、全ページがレスポンシブ対応になっており、「投稿」等の表記がサイズによって変更します

## 課題や今後実装したい機能
- 非同期通信の実装
- 複数画像の投稿
- 編集時に画像が表示されない点の修正
- fullcalenderの機能の追加
- オンラインショッピング関係のapiの導入
- テストの追加