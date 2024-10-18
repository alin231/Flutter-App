# check_models.py
import os
import google.generativeai as genai

# Configure your API key
genai.configure(api_key=os.environ['API_KEY'])

# List all tuned models
tuned_models = genai.list_tuned_models()
for model in tuned_models:
    print(f"Model Name: {model.name}, Status: {model.state}")

for model_info in genai.list_tuned_models():
    print(model_info.name)
    model = genai.GenerativeModel(model_name=model_info.name)
    result = model.generate_content("幫我用another這個單字的中文諧音，輸出為:英文單字/中文意思/諧音/諧音/解釋")
    print(result.text)
    #genai.delete_tuned_model(model_info.name)

# Check details of your specific model
#model_details = genai.get_tuned_model("tunedModels/testing_model")
#print(model_details)

