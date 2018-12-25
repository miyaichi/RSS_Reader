# RSS_Reader

RSSフィードのタイトルをAlexa Pollyで読み上げる/Alexaにリマインダー登録するUiPathワークフロー

## 内容

UiPathでAWS PollyやAlexaでの音声情報を提供するの技術検証として、RSSフィードのタイトルをAWS Pollyで読み上げたり、Alexaにリマインダーとして登録したりします。ただし、UiPathからAWSを呼び出すカスタムアクティビティがないため、読み上げはPollyをAWS CLIを呼出しmp3を再生、リマインダーはAlexaの管理画面（ https://alexa.amazon.com )から登録する形式としています。

## 設定

Data¥Condig.xlsxで以下の設定ができます。

Settingタブ

| Name                     | Default                                 | Description                                                                       |
|:-------------------------|:----------------------------------------|:----------------------------------------------------------------------------------|
| logF_BusinessProcessName | RSS_Reader                              | ワークフローの名称（ログに出力されます）                                          |
| RSS_Feed_URL             | https://news.yahoo.co.jp/pickup/rss.xml | RSS_フィードのURL                                                                 |
| Alexa_Process            | -                                       | Speech:(Pollyで読み上げる),Reminder:(リマインダー登録する)                        |
| Alexa_Device_Name        | -                                       | リマインダーを登録するAlexaデバイス名                                             |
| Alexa_Credential         | Alexa                                   | https://alexa.amazon.com にログインするためのEmail/Passwordを登録するCredential名 |
| Alexa_Voice_ID           | Mizuki                                  | Alexa Pollyで読み上げる音声（Mizuki: 女性、Takumi: 男性）                         |

## AWSの設定

AWS CLIをインストールし、AWS Pollyを利用できるようにしたIAMアカウントを登録してください。テストでは、以下のポリシーを設定しました。

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Permissions1",
            "Effect": "Allow",
            "Action": [
                "polly:SynthesizeSpeech",
                "polly:DescribeVoices"
            ],
            "Resource": "*"
        }
    ]
}
```

## MP3 Readerの設定

AWS Pollyで作成した音声ファイルを読み上げるのに、Command Line MP3 Player for Windows ( https://lawlessguy.wordpress.com/2015/06/27/update-to-a-command-line-mp3-player-for-windows/ )を利用しています。利用にあたっては、同ソフトウェアのライセンス（MIT)を確認の上、実行形式をSpeechフォルダにコピーしてください。
