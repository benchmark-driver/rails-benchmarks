# rails-benchmarks

Rails benchmark scripts for benchmark\_driver.gem

## Usage

`--dir` option is required for some benchmarks. Use other options as you like.

```bash
$ be benchmark-driver actionview/render_html.yml --dir --compare --rbenv '2.0.0;2.4.2' --filter erb
Calculating -------------------------------------
                          2.0.0       2.4.2
                 erb    22.419k     35.266k i/s -     20.000k in 0.892102s 0.567126s

Comparison:
         erb (2.4.2):     35265.5 i/s
         erb (2.0.0):     22419.0 i/s - 1.57x  slower
```

## License

MIT License
