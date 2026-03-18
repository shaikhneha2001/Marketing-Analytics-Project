# Marketing-Analytics-Project
End‑to‑end marketing analytics with SQL, Python, sentiment analysis, and Power BI dashboards.
## 📂 Project Structure

---

## 🚀 Features
- **SQL Data Cleaning**
  - Join customer and geography tables
  - Categorize product prices (low, medium, high)
  - Normalize engagement data (views, clicks, likes)
  - Remove duplicates in customer journey data
- **Python Integration**
  - Connect to SQL Server using `pyodbc`
  - Apply sentiment analysis with NLTK’s VADER
- **Analytics Ready**
  - Clean datasets for Power BI dashboards
  - Customer segmentation, engagement funnel, and product performance metrics

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/MarketingAnalyticsProject.git
cd MarketingAnalyticsProject
### 2. Install Dependencies
pip install -r requirements.txt
### 3. Configure SQL Server Connection
conn_str = (
    "Driver={ODBC Driver 18 for SQL Server};"
    "Server=localhost;"
    "Database=MarketingAnalytics;"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;"
)
### 4. Run the Project
python main.py
📊 Example Dashboards
The cleaned data can be visualized in Power BI to show:
- Conversion rate trends
- Engagement funnel (views → clicks → likes)
- Customer sentiment by product
- Geographic segmentation of customers

🛠 Requirements
- Python 3.8+
- SQL Server (local or remote)
- Libraries:
- pandas
- nltk
- pyodbc

📈 Future Enhancements
- Automate ETL pipeline
- Add advanced sentiment analysis (topic modeling)
- Deploy dashboards with real-time refresh

👩‍💻 Author
Created by Neha — passionate about data analytics, Power BI storytelling, and actionable insights.

---

👉 Save this as `README.md` in your project folder, then upload it along with your code to GitHub.  

Would you like me to also generate a **requirements.txt** file for you, so you don’t have to manually list dependencies?





