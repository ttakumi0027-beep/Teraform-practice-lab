
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


## Git管理

- 以下を、gitignoreに記載

terraformのAWS IDが入っている可能性があるため、以下はGitで管理しない
```.gitignore
# git init で作られるプラグイン
.terraform/

# Terraformが管理しているインフラの状態
*.tfstate
*.tfstate.*
```
