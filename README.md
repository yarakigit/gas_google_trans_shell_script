## git clone
~~~bash
$ git clone git@github.com:yarakigit/gas_google_trans_shell_script.git ~/.gas_google_trans_shell_script
~~~
## GAS
- `デプロイ` -> `新しいデプロイ` -> `ウェブアプリ` -> `次のユーザとして実行 : 自分, アクセスできるユーザー : 全員`
## `settings.json`
~~~json
{
    "gas_url":"https://YOUR_GAS_URL/exec"
}
~~~

## alias
~~~bash
alias trans_eng='zsh $HOME/.gas_google_trans_shell_script/trans_eng.sh'
alias trans_jp='zsh $HOME/.gas_google_trans_shell_script/trans_jp.sh'
~~~