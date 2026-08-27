# Data Analysis

Personal notes and practice notebooks for learning data analysis tools in Python.

## Ahmed_numpy_tutorial.ipynb

Hands-on notes on NumPy, the core library for numerical computing and array operations in Python. Organized into sections:

1. **Creating NumPy Arrays** — building arrays from lists, `arange`, `linspace`, `zeros`, `ones`, `full`, `eye` (identity matrix), and random arrays (`random.rand`, `random.randint`)
2. **Data Types (dtype)** — inspecting an array's dtype and converting between types with `astype`
3. **Multi-dimensional Arrays** — creating 2D/3D arrays and reading `shape`, `ndim`, and transposing with `.T`
4. **Indexing and Slicing** — 1D and 2D indexing/slicing, plus boolean (conditional) indexing
5. **Array Operations (Math & Comparisons)** — element-wise arithmetic, scalar broadcasting, and comparison operators
6. **Reshaping and Resizing** — `reshape`, `flatten`, transpose, and combining arrays with `vstack`/`hstack`/`concatenate`
7. **Dimensions, Axis, and Shape** — how the `axis` parameter controls which dimension an operation collapses, for 2D and 3D arrays
8. **Statistical Operations** — `sum`, `mean`, `median`, `std`, `var`, `min`/`max`, `argmin`/`argmax`
9. **Linear Algebra** — element-wise vs. matrix multiplication, dot product, determinant, inverse, transpose, eigenvalues/eigenvectors
10. **Useful Array Methods** — sorting, unique elements, and searching with `np.where`
11. **Practical Examples** — space reserved for applying these concepts to worked examples

## Ahmed_pandas_tutorial.ipynb

Hands-on notes on pandas, the library for working with tabular data (DataFrames) in Python. Practiced on `orders.csv`. Covers:

1. **Loading Data** — `read_csv`, building a DataFrame from a dict, notes on `read_excel`
2. **Inspecting a DataFrame** — `head`/`tail`, `info`, `describe`, `columns`, `index`
3. **Selecting Data** — single/multiple column selection, and position-based selection with `iloc`
4. **Filtering (Boolean Indexing)** — comparison operators, combining conditions with `&`/`|`, `isin`/`~isin`, and string filters (`str.startswith`, `str.endswith`)
5. **Modifying Data** — conditional updates with `loc`, renaming columns with `rename`
6. **Handling Missing Data** — `dropna`, `fillna` (with `inplace`)
7. **Removing Rows** — `drop`
8. **Aggregating & Summarizing** — `value_counts`, `groupby`, `sort_values`
9. **Exporting Data** — writing back out with `to_csv`

## Ahmed_matplotlib_tutorial.ipynb

Hands-on notes on Matplotlib, the core plotting library in Python, including its integration with NumPy and pandas. Covers:

1. **Getting Started** — pyplot (`plt`) vs. object-oriented (`fig, ax`) approaches, `%matplotlib inline`, `plt.style.use`
2. **Line Plots** — basic line plots, multiple lines with a legend, custom line styles/markers/colors (format strings, named colors, hex codes)
3. **Scatter Plots** — basic scatter plots, and mapping color/size to data with a colorbar
4. **Bar Charts** — vertical (`bar`) and horizontal (`barh`) bars, grouped bar charts
5. **Histograms** — single and overlapping histograms (`hist`)
6. **Subplots** — building multi-panel figures with `plt.subplots(nrows, ncols)`
7. **Working with Pandas** — plotting straight from a DataFrame with `.plot()`, combining it with `groupby`
8. **Advanced Customization** — annotations/text (`annotate`, `text`), reference lines (`axvline`/`axhline`), custom legends, and built-in styles (`plt.style.available`)
9. **Pie Charts** — `pie`, with `explode` and `autopct` for percentage labels
10. **Saving Plots** — `fig.savefig` to PNG (raster) and PDF (vector), with `dpi` and `bbox_inches` options
