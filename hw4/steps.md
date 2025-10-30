# Steps: как я получил визуализации для 1A3N в UCSF Chimera

## Подготовка
1. Перешёл на страницу структуры: [https://www.rcsb.org/structure/1A3N](https://www.rcsb.org/structure/1A3N)
2. Нажал **Download Files → PDB Format (Legacy PDB)** и сохранил `1A3N.pdb`.
3. Запустил UCSF Chimera.

---

## 1 Wireframe
1. **File → Open → 1A3N.pdb** (открыли чистую модель)  
2. **Дополнительно**: можно очистить сцену от лишних элементов:  
   - **Actions → Ribbon → hide**  
   - **Actions → Surface → hide**  
3. **Actions → Atoms/Bonds → wire** (каркасная модель)  
4. Сохранить изображение: **wireframe.png**

---

## 2 Backbone
1. Закрыть текущую модель → **File → Close**  
2. **File → Open → 1A3N.pdb**  
3. Опционально скрыть лишние элементы: **Actions → Ribbon → hide**, **Actions → Surface → hide**  
4. **Select → Structure → backbone only**  
5. **Actions → Atoms/Bonds → stick**  
6. Сохранить изображение: **backbone.png**

---

## 3 Spacefill
1. Закрыть модель → открыть заново **1A3N.pdb**  
2. Опционально: Actions → Ribbon → hide, Actions → Surface → hide  
3. **Actions → Atoms/Bonds → sphere**   
4. Сохранить изображение: **spacefill.png**

---

## 4 Ribbons
1. Закрыть модель → открыть заново **1A3N.pdb**  
2. **Actions → Ribbon → show**  
3. Опционально убрать атомы: **Actions → Atoms/Bonds → hide**  
4. Сохранить изображение: **ribbons.png**

---

## 5 Molecular surface
1. Закрыть модель → открыть заново **1A3N.pdb**  
2. Опционально: Actions → Ribbon → hide, Actions → Atoms/Bonds → hide  
3. **Actions → Surface → show**  
4. Настройки поверхности: Tools → Surface/Binding Analysis → Surface Color 
5. Сохранить изображение: **surface.png**

---

## 6 Раскраска — CPK
1. Закрыть модель → открыть заново **1A3N.pdb**  
2. Выбрать любое представление (например, Wireframe)  
3. **Actions → Color → by element**  
4. Сохранить изображение: **color_cpk.png**

---

## 7 Раскраска по доменам / цепям (рабочий вариант)

1. Закрыть модель → открыть заново **1A3N.pdb**  
2. Для раскраски отдельных цепей:
   - **Select → Chain → A**  
     → **Actions → Color → red**  
   - **Select → Chain → B**  
     → **Actions → Color → blue**  
   - Аналогично для цепей C, D и других  
3. Для окраски отдельного домена или диапазона резидов:
   - **Select → Residue → 45-120**  
     → **Actions → Color → green**  
4. Сохранить изображение: **domains.png**

---

## 8 Изображение публикационного качества
1. Закрыть модель → открыть заново **1A3N.pdb**  
2. Выбрать представление **Ribbons + Surface (частично прозрачная поверхность)**  
3. Настройки:  
   - Фон: **Actions → Color → background → white**  
   - Прозрачность поверхности: **Surface → set transparency ≈ 30%**     
4. Сохранить изображение в высоком разрешении: **File → Save Image → final_publication.png**
