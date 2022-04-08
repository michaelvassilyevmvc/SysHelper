using System;
using DevExpress.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MFKSHelper.SpeedRun
{
    
		public static class GridViewExtended
		{
			public static object GetEditFormTemplateValueID(this ASPxGridView grid, string columnName, string controlName)
			{
				object result = null;

				GridViewDataColumn column = grid.DataColumn(columnName);
				ASPxComboBox combo = (grid.FindEditRowCellTemplateControl(column, controlName) as ASPxComboBox);
				if (combo != null)
				{
					result = combo.Value;
				}
				return result;
			}

		/// <summary>
		/// Возвращает ссылку на столбец, приведенную к типу GridViewDataColumn
		/// (вместо GridViewColumn по умолчанию)
		/// </summary>
		/// <param name="table"></param>
		/// <param name="columnName"></param>
		/// <returns></returns>
		public static GridViewDataColumn DataColumn(this ASPxGridView table, string columnName)
			{
				if (table.Columns[columnName] == null)
				{
					return null;
				}
				if (!(table.Columns[columnName] is GridViewDataColumn))
				{
					return null;
				}
				GridViewDataColumn result = (table.Columns[columnName] as GridViewDataColumn);
				return result;
			}

			public static GridViewToolbar GetToolbar(this ASPxGridView table, string name)
			{
				GridViewToolbar result = table.Toolbars.FindByName(name);
				return result;
			}

			public static GridViewToolbarItem GetItem(this GridViewToolbar toolbar, string name)
			{
				GridViewToolbarItem result = null;
				try
				{
					result = toolbar.Items.FindByName(name);
				}
				catch { }
				return result;
			}

			public static GridViewToolbarItem GetItem(this GridViewToolbarItem toolbar, string name)
			{
				GridViewToolbarItem result = null;
				try
				{
					result = toolbar.Items.FindByName(name);
				}
				catch { }
				return result;
			}

			[Obsolete("Используйте метод GetString с параметром GridSearch.KeyValue", true)]
			public static string GetStringByKey(this ASPxGridView table, object keyValue, string fieldName)
			{
				return table.GetString(keyValue, fieldName, GridSearch.KeyValue);
			}

			/// <summary>
			/// Возвращает значение с типом данных String из заданного столбца в текущей строке
			/// по номеру строки или ключу, как указано в параметре search
			/// </summary>
			/// <param name="table"></param>
			/// <param name="visibleIndex">Номер строки или ключ</param>
			/// <param name="fieldName">Имя поля в столбце</param>
			/// <param name="search">Выбор: искать по номеру строки или ключу</param>
			/// <returns></returns>
			public static string GetString(this ASPxGridView table, object visibleIndex, string fieldName, GridSearch search)
			{
				object result;
				if (search == GridSearch.VisibleIndex)
				{
					result = table.GetString(Convert.ToInt32(visibleIndex), fieldName);
				}
				else
				{
					result = table.GetRowValuesByKeyValue(visibleIndex, fieldName);
				}
				return Convert.ToString(result);
			}

			/// <summary>
			/// Возвращает значение с типом данных String из заданного столбца в текущей строке
			/// по номеру строки
			/// </summary>
			/// <param name="table"></param>
			/// <param name="visibleIndex"></param>
			/// <param name="fieldName"></param>
			/// <returns></returns>
			public static string GetString(this ASPxGridView table, int visibleIndex, string fieldName)
			{
				object result = table.GetRowValues(visibleIndex, fieldName);
				return Convert.ToString(result);
			}

			public static string GetTrim(this ASPxGridView table, int visibleIndex, string fieldName)
			{
				object result = table.GetRowValues(visibleIndex, fieldName);
				return (result ?? string.Empty).ToString().Trim();
			}

			/// <summary>
			/// Возвращает значение с типом данных Int64 из заданного столбца в текущей строке
			/// по номеру строки
			/// </summary>
			/// <param name="table"></param>
			/// <param name="visibleIndex">Номер строки</param>
			/// <param name="fieldName">Имя поля в столбце</param>
			/// <returns></returns>
			public static long GetInt64(this ASPxGridView table, int visibleIndex, string fieldName)
			{
				object result = table.GetRowValues(visibleIndex, fieldName);
				return Convert.ToInt64(result);
			}

			/// <summary>
			///  Возвращает значение с типом данных Int32 из заданного столбца в текущей строке
			/// по номеру строки или ключу, как указано в параметре search
			/// </summary>
			/// <param name="table"></param>
			/// <param name="visibleIndex">Номер строки или ключ</param>
			/// <param name="fieldName">Имя поля в столбце</param>
			/// <param name="search">Выбор: искать по номеру строки или ключу</param>
			/// <returns></returns>
			public static int GetInt32(this ASPxGridView table, object visibleIndex, string fieldName, GridSearch search)
			{
				object result;
				if (search == GridSearch.VisibleIndex)
				{
					result = table.GetInt32(Convert.ToInt32(visibleIndex), fieldName);
				}
				else
				{
					result = table.GetRowValuesByKeyValue(visibleIndex, fieldName);
				}
				return Convert.ToInt32(result);
			}

			/// <summary>
			/// Возвращает значение с типом данных Int32 из заданного столбца в текущей строке
			/// по номеру строки
			/// </summary>
			/// <param name="table"></param>
			/// <param name="visibleIndex">Номер строки</param>
			/// <param name="fieldName">Имя поля в столбце</param>
			/// <returns></returns>
			public static int GetInt32(this ASPxGridView table, int visibleIndex, string fieldName)
			{
				object result = table.GetRowValues(visibleIndex, fieldName);
				return Convert.ToInt32(result);
			}

			public static DateTime GetDateTime(this ASPxGridView table, object visibleIndex, string fieldName, GridSearch search)
			{
				object result;
				if (search == GridSearch.VisibleIndex)
				{
					result = table.GetDateTime(Convert.ToInt32(visibleIndex), fieldName);
				}
				else
				{
					result = table.GetRowValuesByKeyValue(visibleIndex, fieldName);
				}
				return Convert.ToDateTime(result);
			}

			/// <summary>
			/// Возвращает значение с типом данных DateTime из заданного столбца в текущей строке
			/// по номеру строки
			/// </summary>
			/// <param name="table"></param>
			/// <param name="visibleIndex">Номер строки</param>
			/// <param name="fieldName">Имя поля в столбце</param>
			/// <returns></returns>
			public static DateTime GetDateTime(this ASPxGridView table, int visibleIndex, string fieldName)
			{
				object result = table.GetRowValues(visibleIndex, fieldName);
				return Convert.ToDateTime(result);
			}

			public static string GetFormat(this ASPxGridView table, string format, int visibleIndex, string fieldName)
			{
				object result = table.GetRowValues(visibleIndex, fieldName);
				return string.Format(format, result);
			}

			/// <summary>
			/// Возвращает значение с типом данных Boolean из заданного столбца в текущей строке
			/// по номеру строки
			/// </summary>
			/// <param name="table"></param>
			/// <param name="visibleIndex">Номер строки</param>
			/// <param name="fieldName">Имя поля в столбце</param>
			/// <returns></returns>
			public static bool GetBoolean(this ASPxGridView table, int visibleIndex, string fieldName)
			{
				object result = table.GetRowValues(visibleIndex, fieldName);
				return Convert.ToBoolean(result);
			}
		}

		/// <summary>
		/// Способ поиска строки
		/// </summary>
		public enum GridSearch
		{
			VisibleIndex,

			KeyValue,
		}
}
