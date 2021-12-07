
from keras.preprocessing.image import ImageDataGenerator
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D
from keras.layers import Activation, Dropout, Flatten, Dense
from keras import backend as K
import matplotlib.pyplot as plt
import os
import glob
import numpy as np
import random
from keras.preprocessing.image import  img_to_array, load_img
from PIL import Image
img_width, img_height = 120, 120

train_data_dir = 'CCL_test/train'
validation_data_dir = 'CCL_test/validation'
nb_train_samples = 2085
nb_validation_samples = 636
epochs = 200
batch_size = 50

if K.image_data_format() == 'channels_first':
    input_shape = (3, img_width, img_height)
else:
    input_shape = (img_width, img_height, 3)

model = Sequential()
model.add(Conv2D(32, (3, 3), input_shape=input_shape))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(32, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Conv2D(64, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))

model.add(Flatten())
model.add(Dense(64))
model.add(Activation('relu'))
model.add(Dropout(0.5))
model.add(Dense(1))
model.add(Activation('sigmoid'))

model.compile(loss='binary_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

# this is the augmentation configuration we will use for training
train_datagen = ImageDataGenerator(
    rescale=1. / 255,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True)

# this is the augmentation configuration we will use for testing:
# only rescaling
test_datagen = ImageDataGenerator(rescale=1. / 255)

train_generator = train_datagen.flow_from_directory(
    train_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='binary')

validation_generator = test_datagen.flow_from_directory(
    validation_data_dir,
    target_size=(img_width, img_height),
    batch_size=batch_size,
    class_mode='binary')

history=model.fit_generator(
    train_generator,
    steps_per_epoch=nb_train_samples // batch_size,
    epochs=epochs,
    validation_data=validation_generator,
    validation_steps=nb_validation_samples // batch_size)

model.save_weights('first_try.h5')

def show_train_history(train_history,train,validation):
    plt.plot(train_history.history[train])
    plt.plot(train_history.history[validation])
    plt.title(str('train history'))
    plt.ylabel(train)
    plt.xlabel('EPOCH')
    plt.legend(['train','validation'],loc ='upper left')
    plt.show()
    
show_train_history(history,'accuracy','val_accuracy')
show_train_history(history,'loss','val_loss')
dict_labels = {"Without_CCL":1, "With_CCL":0}
size = (120,120) 
nbofdata=50   
#%%
for folders in glob.glob("CCL_test/test/*"):
    print(folders)
    images=[]
    labels_hot=[]
    labels=[]
    nbofdata_i=1
    for filename in os.listdir(folders):
        if nbofdata_i <= nbofdata:
                    label = os.path.basename(folders)
                    className = np.asarray(label)
                    img=load_img(os.path.join(folders,filename))
                    print(type(img))
                    print(img.format)
                    print(img.mode)
                    print(img.size)

                    img=img.resize(size,Image.BILINEAR)
                    if img is not None:
                        if label is not None:
                            labels.append(className)
                            labels_hot.append(dict_labels[label])
                        x=img_to_array(img)
                        images.append(x)
                    nbofdata_i+=1
    images=np.array(images)    
    labels_hot=np.array(labels_hot)
    print("images.shape={}, labels_hot.shape=={}".format(images.shape, labels_hot.shape))    
    imagesavepath='CCL_Dataset/'
    if not os.path.exists(imagesavepath):
        os.makedirs(imagesavepath)
    np.save(imagesavepath+'{}_images.npy'.format(label),images)    
    np.save(imagesavepath+'{}_label.npy'.format(label),labels)    
    np.save(imagesavepath+'{}_labels_hot.npy'.format(label),labels_hot)
    print('{} files has been saved.'.format(label))
images_all=[]
labels_all=[]
#Read cat npy file
images_cat=np.load('CCL_Dataset\Without_CCL_images.npy')
images_all=images_cat
labels_cat=np.load('CCL_Dataset\Without_CCL_labels_hot.npy')
labels_all=labels_cat
#Read dog npy file
images_dog=np.load('CCL_Dataset\With_CCL_images.npy')
images_all=np.append(images_all,images_dog,axis=0)
labels_dog=np.load('CCL_Dataset\With_CCL_labels_hot.npy')
labels_all=np.append(labels_all,labels_dog,axis=0)

temp = list(zip(images_all, labels_all))
random.shuffle(temp)
images_all_2,labels_all_2= zip(*temp)
images_all_2=np.asarray(images_all_2)
labels_all_2=np.asarray(labels_all_2)

score=model.evaluate(images_all_2,labels_all_2)
print()
print('accuracy',score[1])
pridiction_2=model.predict_classes(images_all_2)
def plot_images_labels_prediction(images,labels,prediction,idx,num=10):
    fig =plt.gcf()
    fig.set_size_inches(12,10)
    if num>25: num=25
    for i in range(0,num):
        ax=plt.subplot(5,5,1+i)
        ax.imshow(images[idx].astype(np.uint8))
        title="label= "+str(labels[idx])
        if len(prediction)>0:
            title+=",predict="+str(prediction[idx])
            
        ax.set_title(title,fontsize=10)
        ax.set_xticks([]);ax.set_yticks([])
        idx+=1
    plt.show()
plot_images_labels_prediction(images_all_2,labels_all_2,pridiction_2,idx=10)




