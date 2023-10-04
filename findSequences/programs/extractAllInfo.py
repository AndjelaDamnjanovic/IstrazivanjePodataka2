import subprocess

subprocess.run(["./StatRepeats", "preprocessed.fasta", "2", "-dn", "-protein", "-out", "direct2all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "3", "-dn", "-protein", "-out", "direct3all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "8", "-dn", "-protein", "-out", "direct8all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "10", "-dn", "-protein", "-out", "direct10all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "17", "-dn", "-protein", "-out", "direct17all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "20", "-dn", "-protein", "-out", "direct20all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "50", "-dn", "-protein", "-out", "direct50all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "100", "-dn", "-protein", "-out", "direct100all.out"])

subprocess.run(["./StatRepeats", "preprocessed.fasta", "2", "-in", "-protein", "-out", "indirect2all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "3", "-in", "-protein", "-out", "indirect3all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "8", "-in", "-protein", "-out", "indirect8all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "10", "-in", "-protein", "-out", "indirect10all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "17", "-in", "-protein", "-out", "indirect17all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "20", "-in", "-protein", "-out", "indirect20all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "50", "-in", "-protein", "-out", "indirect50all.out"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "100", "-in", "-protein", "-out", "indirect100all.out"])