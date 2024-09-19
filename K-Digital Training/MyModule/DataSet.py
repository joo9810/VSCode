import torch 
import torch.nn as nn
import torch.nn.functional as F 
import torch.optim as optim
from torchmetrics.classification import F1Score
from torchinfo import summary

from torch.utils.data import Dataset, DataLoader

import pandas as pd
from sklearn.preprocessing import LabelEncoder

# ----------------------------------------------------
# 클래스 목적 : 학습용 데이터셋 텐서화 및 전처리
# 클래스 이름 : CustomDataSet
# 부모 클래스 : torch.utils.data.Dataset
# 매개   변수 : featureDF, targetDF
# ----------------------------------------------------

class CustomDataset(Dataset):
    # 데이터 로딩 및 전처리 진행과 인스턴스 생성 메서드
    def __init__(self, featureDF, targetDF):
        super().__init__()
        self.featureDF = featureDF
        self.targetDF = targetDF
        self.n_rows = featureDF.shape[0]
        self.n_features = featureDF.shape[1]

    # 데이터의 개수 반환 메서드
    def __len__(self):
        return self.n_rows

    # 특정 index의 데이터와 타겟 반환 메서드 => Tensor 반환!!!
    def __getitem__(self, idx): # 클래스 인스턴스 생성하면 자동으로 호출되는 콜백 메서드
        featureTS = torch.FloatTensor(self.featureDF.iloc[idx].values)
        targetTS = torch.FloatTensor(self.targetDF.iloc[idx].values)
        return featureTS, targetTS