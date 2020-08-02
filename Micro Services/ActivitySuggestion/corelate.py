import pandas as pd
import json
from sklearn import preprocessing
import numpy as np

dummy_data = json.dumps({
    "indexKeys": ["feeling", "jogging", "exercise", "meditate", "paint", "read", "code", "games", "socialize", "socialMedia", "goodSleep", "badSleep", "moderateSleep", "netflix", "smoke", "junkFood"],
    "record": [
        [4, 0, 2, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
        [4, 0, 2, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0]
    ]
}
)


def find_corelations(json_data):
    records = json_data["record"]
    columns = json_data["indexKeys"]

    min_max_scaler = preprocessing.MinMaxScaler()
    records = np.array(records).transpose()
    records = min_max_scaler.fit_transform(records)
    records = records.transpose()
   
    df = pd.DataFrame(records, columns=columns)
    # print(df)

    corrMatrix = df.corr()
    corr = np.array(corrMatrix)[0] 
    # print(corr)
    return corr
    
if __name__ == "__main__":
    find_corelations(dummy_data)
