# 🔮 專案規格書：AI 塔羅占卜網頁 (PyScript + Gemini CLI)

## 1. 專案目標

打造一個運行於瀏覽器的塔羅牌占卜應用。利用 PyScript 讓 Python 邏輯在前端執行，並整合 Gemini API 提供選配的深度 AI 解牌功能。

## 2. 環境與技術棧

- **作業系統**: Linux (Docker Container on Windows WSL2)
- **語言/框架**:
  - Python 3.12 (透過 PyScript 運行於瀏覽器)
  - HTML5 / CSS3 (Mystical UI Style)
- **AI 工具**:
  - 開發階段：Gemini CLI
  - 運行階段：Gemini API (1.5 Flash)
- **部署**: GitHub Actions 自動部署至 GitHub Pages

## 3. 功能需求清單

### 3.1 抽牌系統

- **資料庫**: 包含 22 張大阿爾克那 (Major Arcana) 的牌名與基本牌意。
- **邏輯**:
  - 點擊按鈕後隨機抽取 3 張不重複的牌（代表：過去、現在、未來）。
  - 每張牌需判定「正位」或「逆位」(50% 機率)。

### 3.2 解牌模式 (Token 優化設計)

- **預設模式 (AI Off)**:
  - **預設狀態**: 開關預設為「關閉」。
  - **行為**: 從本地字典提取關鍵字，隨機組合成簡單的解釋，不消耗 API。
- **AI 模式 (AI On)**:
  - **觸發條件**: 使用者手動開啟 Switch 並點擊占卜。
  - **行為**: 將「玩家問題」與「抽中的 3 張牌及其正逆位」發送至 Gemini API。
  - **Prompt 要求**: 以塔羅大師口吻解說，限制在 200 字內，強調三者間的關聯。

### 3.3 使用者介面 (UI)

- **風格**: 深色系（深紫、金、黑），具備神祕感。
- **元件**:
  - 問題輸入框 (`<input type="text">`)。
  - AI 深度解牌開關 (`Checkbox/Switch`)。
  - 三個卡牌顯示槽 (要有翻牌或顯現的視覺效果)。
  - 解讀結果顯示區 (`<div id="result">`)。

## 4. 檔案結構 (預期)

- `index.html`: 包含 UI 結構、CSS 樣式與 PyScript 區塊。
- `.github/workflows/deploy.yml`: GitAction 自動部署設定。

## 5. 開發階段指令 (用於 Gemini CLI)

1.  讀取規格：`@tarot_project_spec.md`
2.  生成代碼：根據規格生成支援 PyScript 的 `index.html`。
3.  測試部署：編寫 GitAction 腳本確保 HTML 順利掛載至 GitHub Pages。
