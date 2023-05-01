# Railsの初期設定
```
script/init
script/bootstrap
```
# Herokuにpush
commitした上で
```
script/heroku-init
git push heroku `git rev-parse --abbrev-ref @`:main
heroku run:detached rails db:migrate
```
