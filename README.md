# Kyle Howells' Homebrew Tap

Homebrew formulae for Kyle Howells' open-source tools.

## Granite-MLX

[Granite-MLX](https://github.com/kylehowells/Granite-MLX) is a native Swift and
MLX command-line tool for transcribing audio and video with IBM Granite Speech
5.0 on Apple Silicon.

Install it with:

```zsh
brew install kylehowells/tap/granite-mlx
```

Then transcribe a file:

```zsh
granite-mlx recording.m4a
```

The formula installs the CLI and its MLX runtime assets, but not model weights.
On first transcription, Granite-MLX downloads its default Q8 speech and
punctuation checkpoints from Hugging Face and stores them in the model cache
reported by `granite-mlx models list`.

Granite-MLX requires Apple Silicon and macOS 14 or newer. Homebrew installs
`ffmpeg` for media formats that AVFoundation cannot decode directly.

## Updating

```zsh
brew update
brew upgrade granite-mlx
```

## Uninstalling

```zsh
HOMEBREW_NO_AUTOREMOVE=1 brew uninstall granite-mlx
```

`HOMEBREW_NO_AUTOREMOVE=1` prevents Homebrew from using this uninstall as an
opportunity to remove other formulae it currently considers orphaned. It does
not leave any Granite-MLX files installed.

Downloaded model weights are managed separately. To inspect or remove them:

```zsh
granite-mlx models list
granite-mlx models remove --all
```
