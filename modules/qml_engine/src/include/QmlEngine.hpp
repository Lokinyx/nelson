//=============================================================================
// Copyright (c) 2016-2017 Allan CORNET (Nelson)
//=============================================================================
// LICENCE_BLOCK_BEGIN
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// LICENCE_BLOCK_END
//=============================================================================
#include "nlsQml_engine_exports.h"
#include "ArrayOf.hpp"
#include "QmlHandleObject.hpp"
//=============================================================================
namespace Nelson {
    //=============================================================================
    class NLSQML_ENGINE_IMPEXP QmlEngine {
    public:
        static QmlEngine *getInstance();
        QmlHandleObject *loadQmlFile(std::wstring filename);
        QmlHandleObject *setData(std::wstring data);
		QmlHandleObject *createQQuickView(std::wstring filename);

        void evaluateString(std::wstring program);
        void evaluateFile(std::wstring filename);
        void collectGarbage();
        void clearComponentCache();
        wstringVector importPathList();
        wstringVector pluginPathList();
        std::wstring offlineStoragePath();

        void addImportPath(std::wstring path);
        void addPluginPath(std::wstring path);
        void setOfflineStoragePath(std::wstring dir);
    private:
        QmlEngine();
        static QmlEngine *m_pInstance;
    };
    //=============================================================================
}
//=============================================================================
