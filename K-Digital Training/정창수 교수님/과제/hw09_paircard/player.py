class Player:
    def __init__(self, name):
        self.name = name
        self.holding_card_list = list()
        self.open_card_list = list()

    def add_card_list(self, card_list):
        for i in card_list:
            self.holding_card_list.append(i)

    def display_two_card_lists(self):
        print(f'[{self.name}] Open card list: {len(self.open_card_list)}\n\n')
        for i in self.open_card_list:
            print(i, end = ' ')
        print()
        print(f'[{self.name}] Holding card list: {len(self.holding_card_list)}')
        for i in self.holding_card_list:
            print(i, end = ' ')
        print()

    def check_one_pair_card(self):
        finished = False
        while True:
            changed = False
            for i in range(len(self.holding_card_list)): # 0 ~ 5
                for j in range(i+1, len(self.holding_card_list)): # 1 ~ 5
                    if self.holding_card_list[i] == self.holding_card_list[j]:
                        self.open_card_list.append(self.holding_card_list.pop(i))
                        self.open_card_list.append(self.holding_card_list.pop(j-1))
                        # i를 뽑으면 한칸 줄어들어 j-1 인덱스
                        changed = True
                        break
                if changed == True:
                    continue

            finished = True
            if finished == True:
                break

if __name__ == '__main__':
    player1 = Player('흥부')
    player1.add_card_list([1, 2, 3, 4, 1, 4])
    player1.display_two_card_lists()
    player1.check_one_pair_card()
    player1.display_two_card_lists()