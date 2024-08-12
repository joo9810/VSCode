from urllib.request import urlopen
from bs4 import BeautifulSoup
import pandas as pd

def hollys_list(start_idx):
    temp_list = []
    for i in range(1, 51):
        url = f'https://www.hollys.co.kr/store/korea/korStore2.do?pageNo={i}&sido=&gugun=&store='
        html = urlopen(url)
        soup = BeautifulSoup(html, 'html.parser')
        for j in range(start_idx, len(soup.find_all('td', {'class' : 'center_t'})), 6):
            temp_list.append(soup.find_all('td', {'class' : 'center_t'})[j].string)
    return temp_list

location = hollys_list(0)
cafe_name = hollys_list(1)
address = hollys_list(3)
number = hollys_list(5)

df = pd.DataFrame({'매장이름' : cafe_name,
                   '지역' : location,
                   '주소' : address,
                   '전화번호' : number})

df.to_csv('hollys_branches.csv', index = False, encoding='utf-8-sig')





