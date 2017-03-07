# UIImagePickerController

## 概要
UIImagePickerControllerは写真やムービーの取得・撮影を管理するクラスです。

## 関連クラス
UINavigationController
NSCoding

## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|-----------|------------|------------|
| delegate | delegateを設定する | imagePicker.delegate |
| sourceType | 画像取得先<br>（iOS10〜info.plistで許可文言の設定をする必要がある。<br>それがないとクラッシュする） | imagePicker.sourceType |
| allowsEditing | 画像取得後の編集を許可するかどうか | imagePicker.allowsEditing |

## 主要メソッド

| メソッド名 | 説明 | サンプル |
|-----------|------------|------------|
| isSourceTypeAvailable(_:) | 指定した画像の取得先が使用できるかどうかを判定する<br>（クラスメソッド） | UIImagePickerController.isSourceTypeAvailable(.photoLibrary) |

## 主要Delegateメソッド

| メソッド名 | 説明 |
|-----------|------------|
| imagePickerController(_:didFinishPickingMediaWithInfo:) | 画像が選択されたら呼ばれる |
| imagePickerControllerDidCancel(_:) | キャンセルされたら呼ばれる |

## UIImagePickerControllerSourceType（Enum）
| cese | 説明 |
|-----------|------------|
| photoLibrary | デバイスのフォトライブラリ |
| camera | デバイスの内蔵カメラ<br>cameraDeviceプロパティを使用して、カメラを指定可能<br>（デフォルトは rear = 背面カメラ） |
| savedPhotosAlbum | デバイスのカメラロール<br>デバイスにカメラがない場合は、[保存した写真]アルバムをソースとして指定 |

## フレームワーク
UIKit.framework

## サポートOSバージョン
iOS2.0以上

## 開発環境
| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |

## 参考
https://developer.apple.com/reference/uikit/uiimagepickercontroller
