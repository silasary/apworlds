import sys
import csv

if len(sys.argv) < 2:
    print("Usage: drag and drop CSV file onto this script, copy WeaponLists data structure back out")
    sys.exit(1)

csv_file = sys.argv[1]

vanilla = []
expanded = []

with open(csv_file, "r", encoding="utf-8") as f:
    reader = csv.reader(f)
    next(reader, None)  # Ignore header

    for row in reader:
        if len(row) < 10:
            continue

        console_name = row[0].strip()
        in_box = row[9].strip().lower()

        if not console_name:
            continue

        if in_box == "true":
            vanilla.append(f'        "{console_name}",')
        else:
            expanded.append(f'        "{console_name}",')

print("WeaponLists(")
print('    table = "vanilla",')
print("    vanilla = [")
for item in vanilla:
    print(item)
print("    ],")
print("    expanded = [")
for item in expanded:
    print(item)
print("    ],")
print("    wallbuys = [],")
print("    special = []")
print("),")
