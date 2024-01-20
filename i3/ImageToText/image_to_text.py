from PIL import Image
import pytesseract
import os
import glob
import pyperclip

def get_latest_screenshot(directory):
    # Get a list of all PNG files in the specified directory
    screenshot_files = glob.glob(os.path.join(directory, '*.png'))

    # Sort the files by modification time and get the latest one
    latest_screenshot = max(screenshot_files, key=os.path.getmtime, default=None)

    return latest_screenshot

def image_to_text(image_path):
    # Open the image file
    image = Image.open(image_path)

    # Use pytesseract to do OCR on the image
    text = pytesseract.image_to_string(image,lang='eng+ne')

    return text

def copy_to_clipboard(text):
    # Use pyperclip to copy the text to the clipboard
    pyperclip.copy(text)

if __name__ == "__main__":
    # Replace '/home/anukul/Pictures/Screenshots/' with the path to your screenshot directory
    screenshot_directory = '/home/anukul/Pictures/Screenshots/'

    # Get the latest screenshot in the directory
    latest_screenshot = get_latest_screenshot(screenshot_directory)

    if latest_screenshot:
        result_text = image_to_text(latest_screenshot)
        # Print the resulting text
        print(result_text)

        # remove all the new line
        result_text = result_text.replace('\n',' ')
        # Copy the text to the clipboard
        copy_to_clipboard(result_text)
    else:
        copy_to_clipboard('')
