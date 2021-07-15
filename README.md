# video_base_app
動画再生アプリのベースリポジトリ

# 開発の流れ（エンジニア向け）
## スクラムマスター
- 山村祐也(@bestriser)

## GitHubの運用ルール([GitHub Flow](https://tracpath.com/bootcamp/learning_git_github_flow.html)と呼ばれる運用フローを採用)
以下の4つを準拠して、masterブランチは常にリリース可能な状態にしながら、GitHubを運用する

1. 新しい作業を開始する際は、必ず、最新のmasterブランチから作業ブランチを切る

1. 作業ブランチは定期的にプッシュする

1. 作業が完了したら、プルリクエストを使って、[コードレビュー](https://docs.github.com/ja/github/collaborating-with-issues-and-pull-requests/about-pull-request-reviews)を依頼する

   * レビュー担当者は、立候補やスクラムマスターの采配で決定する
   
   * レビュー担当者以外の方もコードをチェックしたら、[絵文字でリアクション](https://www.excite.co.jp/news/article/Dreaminnovation_vent_news_b6adl5WCgI/)で盛り上げていこう
  
   * コードレビューで2人目の[Approve](https://docs.github.com/ja/github/collaborating-with-issues-and-pull-requests/approving-a-pull-request-with-required-reviews)が出たら、2人目のレビュー担当者が速やかに[Squash and merge](https://docs.github.com/ja/github/collaborating-with-issues-and-pull-requests/merging-a-pull-request)を実行する

## 各ブランチの役割と命名規則
### masterブランチ
- リリース可能な状態だけを管理する

- 特定のブランチからマージすることによってしか更新されない

- 直接コミットしてはならないという制約を持つ

- [バージョン毎のtag](https://docs.github.com/ja/github/administering-a-repository/viewing-your-repositorys-releases-and-tags)はここから生まれる

### featureブランチ
- 機能追加・改修などを行う作業ブランチ

- masterブランチから、featureブランチを切る

- レビュー完了後はmasterブランチにマージされ、featureブランチは[Squash and merge](https://docs.github.com/ja/github/collaborating-with-issues-and-pull-requests/merging-a-pull-request)を実行した時点で[自動削除](https://docs.github.com/ja/github/administering-a-repository/managing-the-automatic-deletion-of-branches)される

- featureブランチは「feature/(issue番号)_(変更の種類)_(作業内容の簡単な説明)」のような命名規則で作成する

  * 命名例１ ： feature/1_add_buttom_on_login_screen

  * 命名例２ ： feature/2_change_date_picker_on_event_screen

  * 命名例３ ： feature/3_delete_good_buttom_on_video_screen

  * 命名例４ ： feature/4_update_layout_on_withdrawal_screen

## コミットメッセージの書き方
- 冒頭にissue番号を必ず付ける
- 何処の？何を？どんな風に？修正を行ったのか、具体的＆簡潔に書く

  * メッセージ例1 ： #1 ログイン画面にログインボタンを追加した
  
  * メッセージ例2 ： #2 イベント画面の日付選択を英語表記から日本語表記に変更した
  
  * メッセージ例3 ： #3 動画画面のいいねボタンが重複して配置されていたため１つ削除した
  
  * メッセージ例4 ： #4 退会画面の配置方針が変わったため、Widgetのレイアウトを調整した

## プルリクの作成方法（→大まかな流れは[GitHubのDocs](https://docs.github.com/ja/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)を確認)
1. 自分が担当している開発が完了したら、作業ブランチにpushする

1. Pull requestsタブをクリックする

1. New pull request をクリックする

1. compare を作業ブランチに設定し、base を master に設定する

1. プルリク画面の概要欄下に表示される[contributing guidelines](https://github.com/bestriser/video_base_app/blob/master/.github/CONTRIBUTING.md)に沿って必要事項を入力する

1. Create pull request をクリックする
  
## コミュニケーション
  * github 上でコメントのやりとりをする場合はメンション（＠付き）を付けてください。
  * メンションをつけないと相手が気づかない場合があります。

# コーディング規約
## 目的
- 可読性向上  
- 保守性向上  
- 品質向上

## 原則
- 記述方法に悩んだらFlutter大学動画の方式に合わせる。
- Format on save設定を有効にしdartfmtを適用させる。

## 詳細  
(DO 厳守、DON’T 厳禁、PREFER 推奨、AVOID 非推奨、CONSIDER 適宜適切に)

- ### DO: クラス名は大文字開始のupper camel case

例)  
```dart:sample.dart
class BookListModel
```  

- ### DO: 変数、定数、メソッドは小文字開始のlower camel case  

例)  
```dart:sample.dart
void changeKboyText() {
    		kboyText = 'kboyさんかっこいい！！！';
    		notifyListeners();
}
```

- ### DO: ファイル名はスネークケースであり、pageなのかmodelなのかを明示する  

例)  
```dart:sample.dart
signup_page.dart  
signup_model.dart
```

- ### DO: ディレクトリはdomain, presentationのように分け、画面ごとにadd_book、book_list、signupのように分ける  

例)  
![alt](https://github.com/RN24Nishioka/pictures-public/blob/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202020-07-07%209.15.55.png?raw=true)

- ### DO: providerモデルを用いて実装する(stateful widget使わない)

- ### DO: スペース、タブ、改行の細かい仕様はdartfmtに従う。IDEの自動フォーマット機能で簡単に自動採用できる。  
この機能を用いることでdartfmtが働き下記gitに記載あるルールでで整形される。  
https://github.com/dart-lang/dart_style/wiki/Formatting-Rules  

#### 設定方法↓  
```
Preference(or Setting)  
→Language & Frameworks  
→Flutter  
→Format code on saveをチェック☑  
(右クリック→Reformat Code with dartfmtでも整形自体は可能。)
```
↓ここにも記載あります↓  
https://github.com/kboy-salon/questions/issues/32#issuecomment-642411563

- ### DO: ライブラリをインポートする際は、dependenciesのバージョンを記載する  
例)   
```dart:sample.dart
  cupertino_icons: ^0.1.3
  firebase_core: ^0.4.5  
  provider: ^4.1.3
  cloud_firestore: ^0.13.7
  intl: ^0.16.1
  flutter_google_places: ^0.2.5
  google_maps_webservice: ^0.0.17
  firebase_auth: ^0.16.1
  keyboard_actions: ^3.2.1+1
  firebase_storage: ^3.1.6
  uuid: ^2.1.0
  image_picker: ^0.6.7+2
  auto_size_text: ^2.1.0
```

- ### PREFER: dartfmtが適応されやすいコードを心がける
    https://dart.dev/guides/language/effective-dart/style#formatting

- ### PREFER: Automatically formatted code with trailing commasを使用する
    * カンマを使用すれば自動的に改行が反映されるので「Format code on save」以外に特別な設定は不要
    * 名前付き引数が2つ以上ある場合は、最後の引数の後ろにもカンマを追加して改行を反映させる
        ```
        Image.network(
          thumbURL,
          fit: BoxFit.fitHeight,
        ),
        ```
    * 名前無し引数であれば、引数が2つ以上あっても長くなり辛いので、最後の引数の後ろにカンマを追加しなくても良い
        * 例：`EdgeInsets.fromLTRB(1,2,3,4)`
        * 例：`builder: (context, model, child)`
    
    https://flutter.dev/docs/development/tools/formatting
    
    ![alt](https://github.com/RN24Nishioka/pictures-public/blob/master/unnamed.png?raw=true)

- ### PREFER: 引数が長い場合や引数が2つ以上ある場合はカンマで区切って改行する(dartfmtを適用すれば自動で改行される)


- ### PREFER: 変数を宣言するときは、型を明示的に指定する
例)
```dart:sample.dart
  String mail;
  String password';
```

- ### PREFER: 文字列を代入する時はシングルクォーテーションに統一する
    * 理由：バラバラだと美しくないから

- ### AVOID: 三項演算子は長くなりすぎないようにする  
例)
```dart:sample.dart
// OK
color: android ? Colors.white : Colors.red,
// NG
color: android ? new Text(...) : new Text(...),
```

- ### AVOID: 余分なコードは減らす  
例) newの使用  

- ### AVOID: マジックナンバーやマジックストリングなどハードコーディングは避ける  
避けれない場合は、他の実装者にも伝わるようにコメントを記載する  
例)  
[マジックナンバーにとは？（Wikipedia）](https://ja.wikipedia.org/wiki/%E3%83%9E%E3%82%B8%E3%83%83%E3%82%AF%E3%83%8A%E3%83%B3%E3%83%90%E3%83%BC_(%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0))

- ### DON’T: Android studio以外 を使う

- ### CONSIDER: その他ここに記載のないことは適宜適切に！
