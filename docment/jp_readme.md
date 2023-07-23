# UnitManager

## 概要

単位を管理する gem です。この gem を活用することで、「円」や「cm」などのモノの単位を扱いやすくします。  
一つの yml ファイルに単位名と単位を表示する時の計算式を記述しておくことで、プログラム内で単位を呼び出す時にその計算式に従って単位名と共に値が出力されます。  
単位や計算式を修正する場合も yml ファイルを編集するのみのため、プログラム上の修正は不要になります。

## 使用方法

### 1. gemfile に追記

```
gem 'unit_manager'
```

### 2. コマンドを利用して gem UnitManager をプロジェクトで利用可能にする

**必ずプロジェクトディレクトリ直下で使用してください(gemfile が存在する場所)**  
 単位を管理する yml ファイルが作成されます。

```
unit init
```

#### 注意

Mac OS の場合にコマンドが実行できない可能性があります。
その場合は Ruby 本体インストール先の bin ファイルから直接 unit スクリプトを実行してください。

```
ruby /Ruby本体インストール先/bin/unit init
```

### 3. /unit_config/unit.yml に扱う単位を記述する

equation で指定した式により計算された値が単位名と共に戻り値として受け取れます。

- key: 単位のキー名 `(キー名を利用してプログラムから単位にアクセスする)`
- name: 単位名 `(プログラムから単位が呼び出された時に値と共に出力される単位名 例: 円)`
- quation: 単位算出式 `(ここで定義された計算式を利用して値が算出されて表示される)`

#### equation について

- 式中の<value>と記述した部分にプログラム内で指定した値が代入されて計算されます。
- 演算子は+, -, \*, /が使用できます。

```
# 例
units:
  - key: money
    name: 円
    equation: <value> * 1.1
  - key: length
    name: m
    equation: <value>
```

### 4. gem を require する

```
require('unit_manager')
```

### 5. unit_manager をプログラム内で利用可能にする

UnitManager::InitializeUnit.new を利用することで、yml ファイルに定義した単位が読み込まれます。  
 UnitManager::InitializeUnit クラスのアクセサメソッドである units に単位情報が入っています。

```
units = UnitManager::InitializeUnit.new.units
```

### 6. 単位を取得する

unit.yml に記述されているキー名が、units のキー名になっています。このキー名によって取得する単位を切り替えます。  
 units['指定のキー名']の中に unit クラスが存在し、unit メソッドによって単位が呼び出されます。このメソッドの引数に値を渡す事によって equation で指定した計算式に従って単位も含めて値を出力します。

```
units['money'].unit(1000)
=> 1100円
```
