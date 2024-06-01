import json
import numpy as np

def lambda_handler(event, context):
    array = np.array([1, 2, 3])
    sum_array = np.sum(array)
    return {
        'statusCode': 200,
        'body': json.dumps(f'The sum is: {sum_array}')
    }
