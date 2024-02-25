int argmax(real[] arr)
{
    if (arr.length == 0) return -1;  // Return -1 for an empty array
    
    int indexMax = 0;
    real maxValue = arr[0];

    for (int i = 1; i < arr.length; ++i)
    {
        if (arr[i] > maxValue)
        {
            maxValue = arr[i];
            indexMax = i;
        }
    }

    return indexMax;
}

// Example usage:
real[] myArray = {3.14, 2.718, 1.618, 4.669};

int indexMax = argmax(myArray);
write("Index of maximum value: ", indexMax);
