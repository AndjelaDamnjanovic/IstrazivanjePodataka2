import subprocess

subprocess.run(["wc", "-l", "direct2all.out"])
subprocess.run(["wc", "-l", "direct3all.out"])
subprocess.run(["wc", "-l", "direct8all.out"])
subprocess.run(["wc", "-l", "direct10all.out"])
subprocess.run(["wc", "-l", "direct17all.out"])
subprocess.run(["wc", "-l", "direct20all.out"])
subprocess.run(["wc", "-l", "direct50all.out"])
subprocess.run(["wc", "-l", "direct100all.out"])

subprocess.run(["wc", "-l", "indirect2all.out"])
subprocess.run(["wc", "-l", "indirect3all.out"])
subprocess.run(["wc", "-l", "indirect8all.out"])
subprocess.run(["wc", "-l", "indirect10all.out"])
subprocess.run(["wc", "-l", "indirect17all.out"])
subprocess.run(["wc", "-l", "indirect20all.out"])
subprocess.run(["wc", "-l", "indirect50all.out"])
subprocess.run(["wc", "-l", "indirect100all.out"])