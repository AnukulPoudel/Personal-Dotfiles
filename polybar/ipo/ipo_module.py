import requests
from bs4 import BeautifulSoup

# URL of the page containing IPO information
url = "https://www.sharesansar.com/"

# Send a GET request to the URL
response = requests.get(url)

# Parse the HTML content
soup = BeautifulSoup(response.content, "html.parser")

# Find the IPO section based on its ID ("upipo" in this case)
ipo_section = soup.find("div", {"id": "myTableEip"})

# Extract IPO details (assuming IPO information is in a table)
ipo_table = ipo_section.find("table")
ipo_rows = ipo_table.find_all("tr")[1:]  # Skip the header row
# Number of IPO
OpenIPO = 0
CommingIPO = 0

# Count the number of available IPOs
for row in ipo_rows:
    status = row.select("td")[7].text.strip()
    if status == 'Open':
        OpenIPO += 1
    if status == 'Coming Soon':
        CommingIPO += 1

# Print the count of available IPOs
print(f"Open: {OpenIPO} Upcomming: {CommingIPO}")
