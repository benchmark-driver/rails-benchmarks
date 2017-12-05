# rails-benchmarks

Rails benchmark scripts for benchmark\_driver.gem

## Usage

`--dir` option is required for some benchmarks.

```bash
$ be benchmark-driver --dir actionview/render_html.yml -c --rbenv '2.0.0;2.4.2'
Calculating -------------------------------------
                          2.0.0       2.4.2
                 erb    23.617k     35.492k i/s -     20.000k in 0.846856s 0.563499s
                haml     8.567k     18.542k i/s -     20.000k in 2.334550s 1.078604s
                slim    23.216k     37.378k i/s -     20.000k in 0.861478s 0.535080s

Comparison:
        slim (2.4.2):     37377.6 i/s
         erb (2.4.2):     35492.5 i/s - 1.05x  slower
         erb (2.0.0):     23616.8 i/s - 1.58x  slower
        slim (2.0.0):     23215.9 i/s - 1.61x  slower
        haml (2.4.2):     18542.5 i/s - 2.02x  slower
        haml (2.0.0):      8567.0 i/s - 4.36x  slower
```

## License

MIT License
