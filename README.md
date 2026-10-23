# Chris' Dotfiles

## What Is This?

This repository serves as my way to help me setup and maintain my Mac. It takes
the effort out of installing everything manually. Feel free to explore, learn
and copy parts for your own dotfiles. Enjoy! :smile:

## New Machine Setup

1. `git clone https://github.com/christianhegedues/dotfiles.git ~/Code/Github/dotfiles`
2. `~/Code/Github/dotfiles/install.sh`
3. Add the printed SSH public keys on GitHub (private → `id_ed25519`, work → `id_ed25519_work`)
4. Re-run `install.sh` — the checks at the end should print nothing
5. Switch the dotfiles remote: `git remote set-url origin git@github-private:christianhegedues/dotfiles.git`

## License

The MIT License. Please see [the license file](LICENSE) for more information.
