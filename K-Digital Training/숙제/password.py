import random

def generator(seed_number):
    random.seed(random.random() + seed_number)

    # 크기가 12인 리스트 생성
    list_data = [0] * 15


    # 가능한 숫자 리스트
    num_list = list(range(10))


    # 가능한 영어 소문자 리스트 
    lower_list = []
    for i in range(ord('a'), ord('z')+1):
        lower_list.append(chr(i))


    # 가능한 영어 대문자 리스트
    upper_list = []
    for i in range(ord('A'), ord('Z')+1):
        upper_list.append(chr(i))


    # 가능한 특수문자 리스트 (!, @, #, $, %, ^, &로 제한)
    special_list = ['!', '@', '#', '$', '%', '^', '&']


    # 12자리의 비밀번호 자리 중 각 자리에 뭐가 들어올지 정하기
    # 랜덤으로 뽑은 숫자가 0: 숫자, 1: 영어 소문자, 2: 영어 대문자, 3: 특수문자
    select_list = []
    for _ in range(15):
        select_list.append(random.randint(0, 3))


    for i in range(15):

        # 만약 select_list[i]가 숫자라면
        if select_list[i] == 0:
            # 숫자가 들어있는 리스트의 인덱스 랜덤 추출
            idx1 = random.randint(0, len(num_list)-1)
            list_data[i] = num_list[idx1]

        # 만약 select_list[i]가 영어 소문자라면
        elif select_list[i] == 1:
            # 영어 소문자가 들어있는 리스트의 인덱스 랜덤 추출
            idx2 = random.randint(0, len(lower_list)-1)
            list_data[i] = lower_list[idx2]

        # 만약 select_list[i]가 영어 대문자라면
        elif select_list[i] == 2:
            # 영어 소문자가 들어있는 리스트의 인덱스 랜덤 추출
            idx3 = random.randint(0, len(upper_list)-1)
            list_data[i] = upper_list[idx3]

        # 만약 select_list[i]가 특수문자라면   
        else:
            # 특수문자가 들어있는 리스트의 인덱스 랜덤 추출
            idx4 = random.randint(0, len(special_list)-1)
            list_data[i] = special_list[idx4]


    for i in list_data:
        print(i, end = '')