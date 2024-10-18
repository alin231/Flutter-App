import os
import google.generativeai as genai
import time

# Set your API key
genai.configure(api_key=os.environ['API_KEY'])

training_data = [
    {"text_input": "幫我用諧音成中文的方式記憶act單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "act / 扮演 / 愛哭 / 愛哭可以當演員"},
    {"text_input": "幫我用諧音成中文的方式記憶address單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "address / 地址 / 兒醉死 / 兒子醉死了，忘記地址"},
    {"text_input": "幫我用諧音成中文的方式記憶afraid單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "afraid / 害怕的 / 惡匪的 / 惡匪的威脅讓人害怕"},
    {"text_input": "幫我用諧音成中文的方式記憶after單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "after / 在之後 / 愛撫他 / 愛他之後就要撫摸他"},
    {"text_input": "幫我用諧音成中文的方式記憶adult單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "adult / 成年人 / 耳道 / 成年人的耳道比較大"},
    {"text_input": "幫我用諧音成中文的方式記憶add單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "add / 添加 / 愛的 / 他愛的料就一直加"},
    {"text_input": "幫我用諧音成中文的方式記憶across單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "across / 穿過 / 我跨濕 / 為了跨過水溝我的褲子濕了"},
    {"text_input": "幫我用諧音成中文的方式記憶above單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "above / 在上面、超過 / 餓飽 / 他很餓結果吃太超過又很飽"},
    {"text_input": "幫我用諧音成中文的方式記憶able單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "able / 能 / 矮爆 / 他真是矮爆了不能夠灌籃"},
    {"text_input": "幫我用諧音成中文的方式記憶again單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "again / 再一次 / 耳根 / 他的耳根子軟讓他又再一次原諒我了"},
    {"text_input": "幫我用諧音成中文的方式記憶age單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "age / 年齡 / 野雞 / 這隻野雞年齡很大"},
    {"text_input": "幫我用諧音成中文的方式記憶agree單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "agree / 同意 / 惡鬼 / 惡鬼同意不再糾纏我了"},
    {"text_input": "幫我用諧音成中文的方式記憶air單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "air / 空氣 / 矮兒 / 矮兒呼吸不到新鮮空氣"},
    {"text_input": "幫我用諧音成中文的方式記憶all單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "all / 一切的 / 噢 / 噢全部給我就對了"},
    {"text_input": "幫我用諧音成中文的方式記憶alone單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "alone / 獨自的 / 耳聾 / 耳聾的他獨自生活"},
    {"text_input": "幫我用諧音成中文的方式記憶allow單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "allow / 允許 / 餌撈 / 這條河允許餌撈"},
    {"text_input": "幫我用諧音成中文的方式記憶airplane單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "airplane / 飛機 / 譜戀 / 他在飛機上譜出一段戀曲"},
    {"text_input": "幫我用諧音成中文的方式記憶ago單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "ago / 在以前 / 耳垢 / 在以前人們有很多耳垢"},
    {"text_input": "幫我用諧音成中文的方式記憶against單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "against / 反對 / 我砍死他 / 誰反對我我砍死他"},
    {"text_input": "幫我用諧音成中文的方式記憶also單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "also / 也 / 我手 / 我手也很小"},
    {"text_input": "幫我用諧音成中文的方式記憶among單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "among / 在之中 / 阿嬤 / 阿嬤在我們全家福之中"},
    {"text_input": "幫我用諧音成中文的方式記憶anger單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "anger / 生氣 / 閹割 / 閹割讓他感到生氣"},
    {"text_input": "幫我用諧音成中文的方式記憶another單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "another / 另一 / 額那熱 / 他額頭那麼熱，再換一個醫生吧"},
    {"text_input": "幫我用諧音成中文的方式記憶ant單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "ant / 螞蟻 / 按他 / 螞蟻一按他就死了"},
    {"text_input": "幫我用諧音成中文的方式記憶any單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "any / 任何 / 愛你 / 任何人中我最愛你"},
    {"text_input": "幫我用諧音成中文的方式記憶answer單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "answer / 回答 / 顏色 / 他回答了最喜歡的顏色"},
    {"text_input": "幫我用諧音成中文的方式記憶animal單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "animal / 動物 / 愛能摸 / 愛了!這間動物園能摸動物"},
    {"text_input": "幫我用諧音成中文的方式記憶always單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "always / 總是 / 愛外食 / 他愛外食所以總是叫外送"},
 {"text_input": "幫我用諧音成中文的方式記憶agony單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "agony / 痛苦的 / 愛過你 / 愛過你是件痛苦的事"}, 
 {"text_input": "幫我用諧音成中文的方式記憶apple單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "apple / 蘋果 / 阿婆 / 阿婆給了我一顆蘋果"}, 
 {"text_input": "幫我用諧音成中文的方式記憶arm單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "arm / 手臂 / 按 / 抽血要按住手臂"}, 
 {"text_input": "幫我用諧音成中文的方式記憶around單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "around / 到處 / 兒亂 / 兒子到處亂跑"}, 
 {"text_input": "幫我用諧音成中文的方式記憶ask單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "ask / 問 / 愛時刻 / 我男朋友很愛時刻傳訊息給我"}, 
 {"text_input": "幫我用諧音成中文的方式記憶area單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "area / 區域 / 埃雷啊 / 快走這塊區域正在不斷埃雷啊"}, 
 {"text_input": "幫我用諧音成中文的方式記憶april單字，並輸出:單字/中文意思/諧音/諧音解釋", "output": "april / 四月 / 約婆了 / 四月清明節約外婆掃墓了"}, ]



# Create and train the model
operation = genai.create_tuned_model(
    display_name="trained_model",
    source_model="models/gemini-1.5-flash-001-tuning",
    epoch_count=20,
    batch_size=4,
    learning_rate=0.001,
    training_data=training_data,
)

# Monitor training progress...
for status in operation.wait_bar():
    time.sleep(10)

# Get the result
result = operation.result()
print("Model trained:", result.name)

