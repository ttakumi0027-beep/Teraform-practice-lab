# 変数

## 1. 変数

locals ローカル変数

variables 外部から変更可能な変数

```hcl
variable "project" {
  type = "string"

}
```

## 2. ブロック

- terraformブロック（terraform全体の設定に関わる）
- terraformとプロバイダーのバージョンを固定する
- providerプロバイダー（AWS GCP Azure）
- 管理ブロック　AWS上にすでに作られているAWSリソースなどを読み込むため
- outputブロック　作成したリソースを外部参照できるようにする

## 3. リファレンス


- [基本構文](https://developer.hashicorp.com/terraform/language/syntax)

- [プロバイダー](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance)

- [組み込み関数](https://developer.hashicorp.com/terraform/language/functions/substr)

# VPC及びEC2の作成

## 1. EC2の作成

```main.tf
provider "aws" {
  profile = "terraform"
  region = "ap-northeast-a"
}

resource "aws_instance" "hello-world" {
  ami = "ami-088103e734f7e0529"
  instance_type = "t3.micro"
}
```

```bash
# terraformの初期化
terraform init

# ソースコードの実行
terraform apply
```




- マネジメントコンソール画面にてEC2が立ち上がっている事を確認

- EC2インスタンスの削除

```bash
terraform destroy
```

##2. Git管理

[gitignoer.io](https://www.toptal.com/developers/gitignore)にアクセスし、"Tearrfrom"と入力し作成。そのまま、.gitignoreファイルにコピペ



