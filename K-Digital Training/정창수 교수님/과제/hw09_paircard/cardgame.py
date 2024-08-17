from card import Card
from player import Player
from gamedealer import GameDealer

def play_game():
    # 두 명의 player 객체 생성
    player1 = Player("흥부")
    player2 = Player("놀부")

    dealer = GameDealer()

    deck = dealer.make_deck()
    dealer.shuffle_deck() # 덱 섞기

    hand_out = 10

    player1.add_card_list(deck[:hand_out])
    player2.add_card_list(deck[hand_out+1:2*hand_out-1])

    deck = deck[2*hand_out:]

    print(f'============================================================')
    dealer.print_deck(deck, f'카드 나누어 주기: {hand_out}장')




if __name__ == '__main__':
    play_game()