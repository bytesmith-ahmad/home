#!usr/bin/bash

from pathlib import Path
from sqlite3 import connect

db = Path("D:\OneDrive\DATA\omnirecords.db")

con = connect(db)
v = con.execute("SELECT sqlite_version()").fetchone()[0]
print(f"connected to SQLite {v}")

t = con.execute("SELECT name FROM sqlite_master WHERE type = 'table'").fetchall()
x = con.execute("SELECT * FROM v_assignments").fetchall()
y = con.execute("SELECT * FROM v_expenses").fetchall()

print(t)
print(x)
print(y)