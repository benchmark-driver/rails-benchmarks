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

### Example executions

```
$ RBENV_VERSION=2.5.0-dev ruby -v
ruby 2.5.0dev (2017-12-05 trunk 61034) [x86_64-linux]
$ bin/bench actionview/render_html.yml --rbenv '2.0.0-p0;2.4.2;2.5.0-dev' --filter haml
Calculating -------------------------------------
                       2.0.0-p0       2.4.2   2.5.0-dev
                haml     9.688k     18.527k     19.874k i/s -     20.000k in 2.064307s 1.079482s 1.006328s

Comparison:
    haml (2.5.0-dev):     19874.2 i/s
        haml (2.4.2):     18527.4 i/s - 1.07x  slower
     haml (2.0.0-p0):      9688.5 i/s - 2.05x  slower
```

```
$ bin/bench actionview/render_html.yml --rbenv '2.0.0-p0;2.4.2;2.5.0-dev' --filter slim
Calculating -------------------------------------
                       2.0.0-p0       2.4.2   2.5.0-dev
                slim    26.552k     38.374k     49.057k i/s -     20.000k in 0.753236s 0.521192s 0.407692s

Comparison:
    slim (2.5.0-dev):     49056.7 i/s
        slim (2.4.2):     38373.6 i/s - 1.28x  slower
     slim (2.0.0-p0):     26552.1 i/s - 1.85x  slower
```

```
$ bin/bench actionview/render_json.yml --rbenv '2.0.0-p0;2.4.2;2.5.0-dev'
Calculating -------------------------------------
                       2.0.0-p0       2.4.2   2.5.0-dev
                  jb     2.390k      3.494k      3.584k i/s -      2.000k in 0.836798s 0.572444s 0.557989s
            jbuilder     1.270k      1.764k      1.817k i/s -      2.000k in 1.575066s 1.134067s 1.100700s

Comparison:
      jb (2.5.0-dev):      3584.3 i/s
          jb (2.4.2):      3493.8 i/s - 1.03x  slower
       jb (2.0.0-p0):      2390.1 i/s - 1.50x  slower
jbuilder (2.5.0-dev):      1817.0 i/s - 1.97x  slower
    jbuilder (2.4.2):      1763.6 i/s - 2.03x  slower
 jbuilder (2.0.0-p0):      1269.8 i/s - 2.82x  slower

```

## License

MIT License
