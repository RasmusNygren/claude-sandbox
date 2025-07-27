# Claude code docker sandbox-ish

I don't trust running claude code with `--dangerously-skip-permissions` on my
host machine but sometimes I want to do that to see what claude can come up 
with without having to babysit it.

This wraps claude code in a docker compose setup that provides some extra safeguards
before running `--dangerously-skip-permissions`.
