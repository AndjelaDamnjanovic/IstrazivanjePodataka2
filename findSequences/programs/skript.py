import subprocess

subprocess.run(["./StatRepeats", "preprocessed.fasta", "2", "-loa", "direct2.fasta", "-dn", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "3", "-loa", "direct3.fasta", "-dn", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "8", "-loa", "direct8.fasta", "-dn", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "10", "-loa", "direct10.fasta", "-dn", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "17", "-loa", "direct17.fasta", "-dn", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "20", "-loa", "direct20.fasta", "-dn", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "50", "-loa", "direct50.fasta", "-dn", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "100", "-loa", "direct100.fasta", "-dn", "-protein"])

subprocess.run(["./StatRepeats", "preprocessed.fasta", "2", "-loa", "indirect2.fasta", "-in", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "3", "-loa", "indirect3.fasta", "-in", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "8", "-loa", "indirect8.fasta", "-in", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "10", "-loa", "indirect10.fasta", "-in", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "17", "-loa", "indirect17.fasta", "-in", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "20", "-loa", "indirect20.fasta", "-in", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "50", "-loa", "indirect50.fasta", "-in", "-protein"])
subprocess.run(["./StatRepeats", "preprocessed.fasta", "100", "-loa", "indirect100.fasta", "-in", "-protein"])