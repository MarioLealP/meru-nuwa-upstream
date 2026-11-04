# $REPO_NAME

$REPO_DESCRIPTION

A Meru app that runs someone else's software, made from the
[Meru/nuwa-upstream](https://git.clockmost.com/Meru/nuwa-upstream) template. There's no code here: the `Dockerfile` is one
`FROM` line pinned to a digest, and `deploy/values.yaml` says how to run it.

## Upgrade

Check the upstream release and its advisories, change the `FROM` line in a PR, merge. Merging to `main` builds the image,
signs it with this app's key, pushes it to Zot and rolls it out.

## Deploy

`deploy/meru.yaml` makes this repo a Meru app: [Meru/meru](https://git.clockmost.com/Meru/meru) finds it and deploys it into
namespace `$REPO_NAME`. Shikigami adds it once the app's fence, signing key and build credentials exist, from
`deploy/meru.yaml.in` with the owner from the request. `deploy/values.yaml` is the app's whole deployment, rendered with the
`nuwa-app` chart from [Meru/nuwa](https://git.clockmost.com/Meru/nuwa). Builds run in namespace `$REPO_NAME-build` on the
runner from [Meru/sindri](https://git.clockmost.com/Meru/sindri). No secrets live in this repo: they come from OpenBao, through
the External Secrets Operator or the build's own login.
