#============================================================================================================
#
# File: ConnectRtoSqlServer.R
#
# Description: R code for Dave Langer's YouTube video "How to Connect R to SQL Server With RODBC"
#              YouTube video available at: https://youtu.be/PoA23UWvXuc
#
#============================================================================================================

#
# Highlight and run the following code to install the RODBC package
#install.packages("RODBC")
#


#
# Load up the mighty RODBC
#
library(RODBC)


#
# Open connection to SQL Server using a Windows ODBC DSN
#
db_conn <- odbcConnect("LocalDSN", rows_at_time = 1)


#
# Check to see if connection was opened, otherwise terminate script
#
if(db_conn == -1) {
  # For a Production system, I would add in some logging
  quit("no", 1)
}


#
# My T-SQL query. A Pareto analysis on AdventureWorks sales.
#
sql <- ""


#
# My T-SQL query. Simple, but illustrates the idea.
#
sales_pareto <- sqlQuery(db_conn, sql, stringsAsFactors = FALSE)


#
# Close the DB connection now that I'm done with it.
#
odbcClose(db_conn)


#
# Examine my R connected to SQL Server awesomeness!
#
View(sales_pareto)