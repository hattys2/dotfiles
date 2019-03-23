autoload -Uz compinit
compinit -u
setopt correct                 # コマンドのスペルを訂正する
setopt auto_list               # 補完候補を一覧で表示する(d)
unsetopt auto_menu             # タブによるファイルの順番切り替えをしない
setopt auto_pushd              # cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_cd                 # ディレクトリ名を入力するだけでcdできるようにする
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt nobeep                  # ビープを鳴らさない
setopt prompt_subst            # 色を使う
setopt no_tify                 # バックグラウンドジョブが終了したらすぐに知らせる。
# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath
path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)
