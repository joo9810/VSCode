import matplotlib.pyplot as plt

def DrawPlot(result):
    fig, axs = plt.subplots(1, 2, figsize = (14, 5))

    label_list = ['Loss', 'Score']

    LENGTH = len(result[0])

    for i in range(2):
        axs[i].plot(range(1, LENGTH+1), result[2*i], label = f'Train {label_list[i]}')
        axs[i].plot(range(1, LENGTH+1), result[2*i+1], label = f'Valid {label_list[i]}')
        axs[i].set_title(label_list[i])
        axs[i].set_xlabel('EPOCH')
        axs[i].set_ylabel('Loss')
        axs[i].legend()
    plt.show()