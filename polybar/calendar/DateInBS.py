import json
from datetime import date

def dateBS(format='dd.mm.yyyy',seperator='-',year = 2080):
    '''

    Converts today's date from AD to BS on the given format(default dd.mm.yyyy other available formats are mm.dd.yyyy, dd.mm.yyyy, yyyy.mm.dd and yyyy.dd.mm) and given seperator (default '-' any other string can be used as a seperator)
    
    '''
    data = {}

    file_path = f'{year}.json'

    with open(file=file_path, mode='r') as files:
        data = json.load(files)

    date_today = str(date.today())

    for month in data:
        days_in_months = len(data[month])
        for day in range(days_in_months):
            ad_date = data[f"{month}"][day]["AD_date"]['ad']
            if(ad_date == date_today):
                bs_day = data[f"{month}"][day]["day"]
                bs_month = data[f"{month}"][day]["month"]
                bs_year = data[f"{month}"][day]["year"]
                # print(f'{bs_day}-{bs_month}-{bs_year}')
    
    if(format=='dd.mm.yyyy'):
        return f'{bs_day}{seperator}{bs_month}{seperator}{bs_year}'
    
    elif(format=='mm.dd.yyyy'):
        return f'{bs_month}{seperator}{bs_day}{seperator}{bs_year}'
    
    elif(format=='yyyy.mm.dd'):
        return f'{bs_year}{seperator}{bs_month}{seperator}{bs_day}'
    
    elif(format=='yyyy.dd.mm'):
        return f'{bs_year}{seperator}{bs_day}{seperator}{bs_month}'
    
    elif(format=='yy.dd.mm'):
        return f'{bs_year}{seperator}{bs_day}{seperator}{bs_month}'
    
    elif(format=='yy.dd.mm'):
        return f'{bs_year}{seperator}{bs_day}{seperator}{bs_month}'
    
    else:
        return 'Invalid arguments'

print(dateBS(format='yyyy.mm.dd',seperator='-', year='2080'))