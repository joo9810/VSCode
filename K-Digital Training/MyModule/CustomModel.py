import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torchinfo import summary
from torchmetrics.regression import *
from torchmetrics.classification import *

# -----------------------------------------------------------------
# 사용자 정의 모델 클래스
# -----------------------------------------------------------------
# 부모 클래스 : nn.Module
# 필수 오버라이딩 : 
#     => __init__()  : 모델 층 구성 (설계)
#     => forward()   : 순방향 학습 진행 코드 구현
# -----------------------------------------------------------------

# cpu로 할지 gpu로 할지
DEVICE = 'cuda' if torch.cuda.is_available() else 'cpu'

# 입력 피쳐 수, 은닉층 퍼셉트론 수, 은닉층 개수가 모두 동적인 모델
class DeepModel(nn.Module):
    def __init__(self, input_in, output_out, hidden_list,
                 act_func, model_type):
        super().__init__() # 부모 클래스 생성

        # 입력층
        self.input_layer = nn.Linear(input_in, hidden_list[0])
        # 은닉층
        self.hidden_layer_list = nn.ModuleList()
        for i in range(len(hidden_list)-1):
            self.hidden_layer_list.append(nn.Linear(hidden_list[i], hidden_list[i+1]))
        # 출력층
        self.output_layer = nn.Linear(hidden_list[-1], output_out)

        self.act_func = act_func
        self.model_type = model_type

    # 순방향/전방향 학습 진행 시 자동 호출되는 메서드 (콜백 함수: 시스템에서 호출되는 함수)
    def forward(self, x):
        # 입력층 학습
        x = self.input_layer(x)
        x = self.act_func(x)

        # 은닉층 학습
        for i in self.hidden_layer_list:
            x = i(x)
            x = self.act_func(x)

        if self.model_type == 'regression': # 회귀
            return self.output_layer(x) # 활성화 함수 안거치고 출력
        elif self.model_type == 'binary': # 이진 분류
            return torch.sigmoid(self.output_layer(x)) # 시그모이드
        elif self.model_type == 'multiclass': # 다중 분류
            return self.output_layer(x) # 소프트맥스
            # 다중 분류의 경우 CrossEntropyLoss에서 내부적으로 log-softmax를 처리하기 때문에
            # 모델의 마지막 출력에서 소프트맥스를 적용하지 않고 바로 전달하면 됨
