namespace NatureManufacture.RAM.Editor
{
    using System.Collections;
    using System.Collections.Generic;
    using UnityEngine;
    using UnityEditor;

    [CustomEditor(typeof(WaterfallProfile)), CanEditMultipleObjects]
    public class WaterfallProfileEditor : Editor
    {
        private void OnSceneDrag(SceneView sceneView, int index)
        {
            Event e = Event.current;

            GameObject go = HandleUtility.PickGameObject(e.mousePosition, false);
            if (!go)
                return;

            var waterfall = go.GetComponent<Waterfall>();


            switch (e.type)
            {
                case EventType.DragUpdated:
                {
                    DragAndDrop.visualMode = waterfall ? DragAndDropVisualMode.Link : DragAndDropVisualMode.Rejected;

                    e.Use();
                    break;
                }
                case EventType.DragPerform when waterfall == null:
                    return;
                case EventType.DragPerform:
                {
                    WaterfallProfile waterfallProfile = (WaterfallProfile) DragAndDrop.objectReferences[0];

                    DragAndDrop.visualMode = DragAndDropVisualMode.Copy;

                    Undo.RecordObject(waterfall, "Lake changed");
                    var waterfallEditor = (WaterfallEditor) CreateEditor(waterfall);

                    waterfall.CurrentProfile = waterfallProfile;
                    waterfallEditor.ResetToProfile();
                 
                    EditorUtility.SetDirty(waterfall);

                    DestroyImmediate(waterfallEditor);


                    DragAndDrop.AcceptDrag();
                    e.Use();
                    break;
                }
            }
        }
        
        public override void OnInspectorGUI()
        {
            base.OnInspectorGUI();
        }
    }
}