# Teraformセットアップ手順


## AWS CLIのインストール

- Mac用のAWS CLIをインストール手順を元にインストール

https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html

```bash
aws --version
aws-cli/2.33.26 Python/3.13.11 Darwin/24.6.0 exe/arm64
```

## IAM作成

AWS CLI用 takumi_tsumuraya

IAMよりアクセスキーの発行

```bash
aws configure

AWS Access Key ID [None]: XXXXXXXX
AWS Secret Access Key [None]: XXXXXXXXX
Default region name [None]: ap-northeast-1
Default output format [None]: json
```




Teraform用 teraform_user


プロファイルが存在すること
ls -la ~/.aws/credentials



## Teraformのインストール

tfenvとはTeraformのバージョンを管理してくれるツール

```bash
cd ~

git clone https://github.com/tfutils/tfenv.git ~/.tfenva

echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.zshrc

source ~/.zshrc
```

```bash
mac:~ tsuburayatakumi$ tfenv
tfenv 3.0.0-70-gc8eb402
Usage: tfenv <command> [<options>]

Commands:
   install       Install a specific version of Terraform
   use           Switch a version to use
   uninstall     Uninstall a specific version of Terraform
   list          List all installed versions
   list-remote   List all installable versions
   version-name  Print current version
   init          Update environment to use tfenv correctly.
   pin           Write the current active version to ./.terraform-version

インストール可能なバージョン一覧を表示
tfenv list-remote

インストール
tfenv install 1.14.5

使うバージョンを指定
tfenv use 1.14.5

バージョンの表示
terraform 1.14.5
```

インストールに詰まった

```
# Macに標準で入っている grep は BSD grep で、tfenv は GNU grep を要求している
A metaphysical dichotomy has caused this unit to overload and shut down. GNU Grep is a requirement and your Mac does not have it. Consider "brew install grep" Failed to resolve 1.14.5 version mac:~ tsuburayatakumi$
```

```bash
brew install grep

#パスを通してあげる
echo 'export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"' >> ~/.zshrc

source ~/.zshrc
```

## git-secretsインストール

アクセスキーとプライベートキーを誤ってリポジトリにコミットしないようにする

```bash
brew install git-secrets

git secrets --install ~/.git-templates/git-secrets

git config --global init.templateDir ~/.git-templates/git-secrets

git secrets --register-aws --global

cd (現在のリポジトリ)

git secrets --install

git secrets --register-aws

```









