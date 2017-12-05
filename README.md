# rails-benchmarks

Rails benchmark scripts for benchmark\_driver.gem

## Usage

`bin/bench` is a wrapper of `benchmark-driver` command.

See `benchmark-driver -h` (or `bin/bench -h`) for available options.

```bash
$ RBENV_VERSION=2.0.0-p0 bundle install
$ RBENV_VERSION=2.4.2 bundle install
$ bin/bench actionview/render_html.yml --rbenv '2.0.0-p0;2.4.2' --filter erb
Calculating -------------------------------------
                       2.0.0-p0       2.4.2
                 erb    24.773k     33.160k i/s -     20.000k in 0.807339s 0.603131s

Comparison:
         erb (2.4.2):     33160.3 i/s
      erb (2.0.0-p0):     24772.7 i/s - 1.34x  slower

```

## License

MIT License
